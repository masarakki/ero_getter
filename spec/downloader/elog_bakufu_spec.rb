# -*- coding: utf-8 -*-
require 'spec_helper'

describe ElogBakufu do
  let(:url) { 'http://bakufu.jp/archives/7955' }
  subject { @dl }

  before do
    @dl = ElogBakufu.new(url)
    fake(:get, url, 'elog_bakufu/sample.html')
  end
  its(:name) { should == 'エログ幕府' }
  its(:title) { should == '見えそうで見えないのが最高にいい生ＪＫの画像 part8 | お宝エログ幕府' }
  its(:base_dir) { should == 'elog_bakufu' }
  its(:sub_directory) { should == '7955' }
  its("targets.count") { should == 40 }
end
