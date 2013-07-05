# -*- coding: utf-8 -*-
require 'spec_helper'

describe MinkChannel do
  let(:url) { "http://minkchan.com/blog-entry-3916.html" }
  subject { @dl }
  before do
    FileUtils.stub(:mkdir_p)
    @dl = MinkChannel.new(url)
    fake(:get, url, 'mink_channel/sample.html')
  end
  its(:title) { should == 'マック店内で清純な制服JKの行儀悪いむっちり太もも晒し撮りうｐ - みんくちゃんねる' }
  its(:sub_directory) { should == '2-3916' }
  its('targets.count') { should == 15 }
end
