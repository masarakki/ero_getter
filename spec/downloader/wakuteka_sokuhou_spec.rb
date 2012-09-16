# -*- coding: utf-8 -*-
require 'spec_helper'

describe WakutekaSokuhou do
  let(:url) { 'http://blog.livedoor.jp/wakusoku/archives/1461175.html' }
  subject { @dl }
  before do
    FileUtils.stub(:mkdir_p)
    @dl = WakutekaSokuhou.new(url)
    fake(:get, url, 'wakuteka_sokuhou/sample.html')
  end

  its(:title) { should == 'わくてか速報 : 【エロ画像】抜かずにはいられない虹エロ画像パート１１９４【詳細付き】 - livedoor Blog（ブログ）' }
  its(:sub_directory) { should == '1461175' }
  its("targets.count") { should == 37 }
end
