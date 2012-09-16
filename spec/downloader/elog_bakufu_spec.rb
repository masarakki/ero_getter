# -*- coding: utf-8 -*-
require 'spec_helper'

describe ElogBakufu do
  let(:url) { 'http://blog.livedoor.jp/samplems-bakufu/archives/51351906.html' }
  subject { @dl }

  before do
    FileUtils.stub(:mkdir_p)
    @dl = ElogBakufu.new(url)
    fake(:get, url, 'elog_bakufu/sample.html')
  end
  its(:name) { should == 'エログ幕府' }
  its(:title) { should == '制服女子がＭ字開脚してるエロ画像 part2 - お宝エログ幕府' }
  its(:base_dir) { should == 'elog_bakufu' }
  its(:sub_directory) { should == '51351906' }
  its("targets.count") { should == 40 }
end
