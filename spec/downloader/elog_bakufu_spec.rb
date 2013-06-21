# -*- coding: utf-8 -*-
require 'spec_helper'

describe ElogBakufu do
  let(:url) { 'http://bakufu.jp/archives/8124' }
  subject { @dl }

  before do
    FileUtils.stub(:mkdir_p)
    @dl = ElogBakufu.new(url)
    fake(:get, url, 'elog_bakufu/sample.html')
  end
  its(:name) { should == 'エログ幕府' }
  its(:title) { should == 'いいともより木下優樹菜の子持ち生乳チラ | お宝エログ幕府' }
  its(:base_dir) { should == 'elog_bakufu' }
  its(:sub_directory) { should == '8124' }
  its("targets.count") { should == 31 }
end
