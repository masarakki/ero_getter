# -*- coding: utf-8 -*-
require 'spec_helper'

describe MinkChannel do
  let(:url) { "http://minkch.com/archives/51930285.html" }
  subject { @dl }
  before do
    FileUtils.stub(:mkdir_p)
    @dl = MinkChannel.new(url)
    fake(:get, url, 'mink_channel/sample.html')
  end
  its(:title) { should == '顔出しＮＧの現役女子大生グラドルが手ブラでおっぱい隠して話題に - みんくちゃんねる' }
  its(:sub_directory) { should == '51930285' }
  its('targets.count') { should == 10 }
end
