require 'spec_helper'

describe EroGetter::Downloader::Base do
  let!(:regex) { %r{http://example.net/\d+.html} }
  before(:all) do
    _regex = regex
    TestClass = Class.new(EroGetter::Downloader::Base) do
      name 'NijiEro BBS'
      url _regex
    end
  end

  describe "assign url_mapping" do
    it { EroGetter.url_mapping.should have_key regex }
    it { EroGetter.url_mapping[regex].should == TestClass }
  end

  describe :instance_methods do
    subject { @klazz }
    context :good do
      before { @klazz = TestClass.new('http://example.net/10101010.html') }
      its(:name) { should == 'NijiEro BBS' }
      its(:url_regex) { should == regex }
      its(:base_dir) { should == 'test_class' }
      its(:http_client) { should be_a HTTPClient }
    end
    context :url_mismatch do
      it {
        lambda {
          TestClass.new('http://example.com/10101010.html')
        }.should raise_error
      }
    end
  end
end
