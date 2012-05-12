require 'spec_helper'

describe EroGetter::Downloader::Base do
  let(:regex) { %r{http://example.net/\d+.html} }
  before do
    _regex = regex
    @klazz = Class.new(EroGetter::Downloader::Base) do
      name 'NijiEro BBS'
      url _regex

      target "ul#sources li a" do |elm|
        elm[:href]
      end

      sub_directory do
        targets.map{|x| x.split(%r{/}).last }.join('/')
      end
    end
    @klazz.stub(:to_s).and_return('TestClass')
  end

  describe "assign url_mapping" do
    it { EroGetter.url_mapping.should have_key regex }
    it { EroGetter.url_mapping[regex].should == @klazz }
  end

  describe :instance_methods do
    subject { @dl }
    context :good do
      before do
        @dl = @klazz.new('http://example.net/10101010.html')
        @dl.stub(:open).and_return(File.open(sample_path('sample.html')))
        EroGetter::Downloader.stub(:mkdir).and_return(true)
        EroGetter.stub('directory').and_return('/tmp')
      end
      its(:name) { should == 'NijiEro BBS' }
      its(:url_regex) { should == regex }
      its(:base_dir) { should == 'test_class' }
      its(:http_client) { should be_a HTTPClient }
      its(:document) { should be_a Nokogiri::HTML::Document }
      its(:title) { should == 'EroGetter Server' }
      its(:url) { should == 'http://example.net/10101010.html' }
      its(:targets) { should == ['https://github.com/masarakki/ero_getter_server',
          'https://github.com/masarakki/ero_getter_chrome_extension'] }
      its(:sub_directory) { should == 'ero_getter_server/ero_getter_chrome_extension' }
      its(:directory) { should == '/tmp/test_class/ero_getter_server/ero_getter_chrome_extension' }
    end
    context :url_mismatch do
      it {
        lambda {
          @klazz.new('http://example.com/10101010.html')
        }.should raise_error
      }
    end
  end
end
