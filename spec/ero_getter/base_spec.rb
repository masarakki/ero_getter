require 'spec_helper'

describe EroGetter::Base do
  let(:regex) { %r{http://example.net/\d+.html} }
  let(:url) { 'http://example.net/10101010.html' }
  subject { @dl }

  context :without_connection do
    before do
      _regex = regex
      fake(:get, url, 'sample.html')
      @klazz = Class.new(EroGetter::Base) do
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
      context :good do
        before do
          @dl = @klazz.new(url)
          EroGetter.stub(:mkdir).and_return(true)
          EroGetter.stub('directory').and_return('/tmp')
        end
        its(:name) { should == 'NijiEro BBS' }
        its(:url_regex) { should == regex }
        its(:base_dir) { should == 'test_class' }
        its(:http_client) { should be_a HTTPClient }
        its(:document) { should be_a Nokogiri::HTML::Document }
        its(:title) { should == 'EroGetter Server' }
        its(:url) { should == url }
        its(:direction) { should == :none }
        its(:targets) { should == ['https://github.com/masarakki/ero_getter_server',
            'https://github.com/masarakki/ero_getter_chrome_extension'] }
        its(:sub_directory) { should == 'ero_getter_server/ero_getter_chrome_extension' }
        its(:directory) { should == '/tmp/test_class/ero_getter_server/ero_getter_chrome_extension' }
        it { subject.send(:filename, "hogehoge.jpg", 1).should == 'hogehoge.jpg' }

        describe :after_run do
          context :not_set_after do
            its(:run_next?) { should be_false }
            its(:run_prev?) { should be_false }
          end

          context :direction_none do
            context :has_next do
              before do
                @dl.stub(:next).and_return('hoge')
              end
              its(:run_next?) { should be_true }
              its(:run_prev?) { should be_false }
            end
            context :has_prev do
              before do
                @dl.stub(:prev).and_return('hoge')
              end
              its(:run_next?) { should be_false }
              its(:run_prev?) { should be_true }
            end
            context :has_next_and_prev do
              before do
                @dl.stub(:prev).and_return('hoge')
                @dl.stub(:next).and_return('hoge')
              end
              its(:run_next?) { should be_true }
              its(:run_prev?) { should be_true }
            end
          end

          context :direction_prev do
            before do
              @dl.stub(:direction).and_return(:prev)
            end
            context :has_next do
              before do
                @dl.stub(:next).and_return('hoge')
              end
              its(:run_next?) { should be_false }
            end
          end

          context :direction_next do
            before do
              @dl.stub(:direction).and_return(:next)
            end
            context :has_pref do
              before do
                @dl.stub(:prev).and_return('hoge')
              end
              its(:run_prev?) { should be_false }
            end
          end
        end
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

  describe :connection do
    before do
      _regex = regex
      klazz = Class.new(EroGetter::Base) do
        url _regex

        connection ['a[rel=prev]', 'a[rel=next]'] do |path|
          path
        end
      end
      @dl = klazz.new(url)
      @dl.stub(:document).and_return(stub)
    end

    context :css_not_found do
      before do
        @dl.document.stub(:css).and_return([])
      end
      its(:prev) { should be_nil }
      its(:next) { should be_nil }
    end
    context :css_find_but_invalid do
      before do
        @dl.document.stub(:css).and_return([false, true, true])
      end
      its(:prev) { should be_nil }
      its(:next) { should be_nil }
    end
    context :css_find_and_valid do
      before do
        x = {:href => 'unko'}
        @dl.document.stub(:css).and_return([x])
      end
      its(:prev) { should == 'unko' }
      its(:next) { should == 'unko' }
    end
  end
  context :with_filename do
    before do
      _regex = regex
      klazz = Class.new(EroGetter::Base) do
        url _regex
        filename do |attr|
          "%04d%s" % [attr[:index], attr[:ext]]
        end
      end
      @dl = klazz.new(url)
    end
    it { @dl.send(:filename, 'hogehoge.jpg', 0).should == '0000.jpg' }
  end
end
