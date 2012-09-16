require 'spec_helper'

describe ShimoSoku do
  subject { @dl }
  let(:url) { 'http://blog.livedoor.jp/pramo/archives/51867686.html' }
  before do
    FileUtils.stub(:mkdir_p)
    @dl = ShimoSoku.new(url)
    fake(:get, url, 'shimo_soku/sample.html')
  end
  its(:sub_directory) { should == '51867686' }
  its("targets.count") { should == 32 }
end
