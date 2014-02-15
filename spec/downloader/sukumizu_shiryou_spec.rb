# -*- coding: utf-8 -*-
require 'spec_helper'

describe SukumizuShiryou do
  let(:url) { 'http://iieshiryoudesu.blog96.fc2.com/blog-entry-2720.html' }
  subject { @dl }

  before do
    @dl = SukumizuShiryou.new(url)
    fake(:get, url, 'sukumizu_shiryou/sample.html')
  end
  its(:name) { should == 'スク水大好き!?いいえ資料です' }
  its(:title) { should == 'エロ画像jpg】騎乗位セックスエロ画像　下から突き上げられて快楽におぼれる女の子がエロイ スク水大好き?いいえ資料です。' }
  its(:base_dir) { should == 'sukumizu_shiryou' }
  its(:sub_directory) { should == '2720' }
  its("targets.count") { should == 30 }
end
