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
      'http://hpcgi2.nifty.com/r-seven/page.cgi?file=copy2/pm/120526/pm_chu2800a.zip',
      'http://hpcgi2.nifty.com/r-seven/page.cgi?file=copy2/pm/120526/pm_chu2800b.zip',
      'http://hpcgi2.nifty.com/r-seven/page.cgi?file=copy2/pm/120526/pm_chu2800c.zip']
  }
  its(:sub_directory) { should == 'pm_chu_002800' }
end

