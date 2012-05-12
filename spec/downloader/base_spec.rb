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
    subject { TestClass.new }
    its(:name) { should == 'NijiEro BBS' }
    its(:url_regex) { should == regex }
    its(:base_dir) { should == 'test_class' }
  end
end
