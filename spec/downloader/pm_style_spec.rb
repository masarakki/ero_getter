require 'spec_helper'

describe PmStyle do
  let(:url) { 'http://mxserver08.net/new_pm/main/movie13716.html' }
  subject { @dl }
  before do
    FileUtils.stub(:mkdir_p)
    fake(:get, url, 'pm_style/test.html')
    @dl = PmStyle.new(url)
  end
  its(:base_dir) { should == 'pm_style' }
  its(:targets) { should == [
      'http://hpcgi2.nifty.com/r-seven/page.cgi?file=copy2/pm/130206/pm_chu3056a.zip',
      'http://hpcgi2.nifty.com/r-seven/page.cgi?file=copy2/pm/130206/pm_chu3056c.zip',
      'http://hpcgi2.nifty.com/r-seven/page.cgi?file=copy2/pm/130206/pm_chu3056b.zip']
  }
  its(:sub_directory) { should == 'pm_chu_003056' }
end

