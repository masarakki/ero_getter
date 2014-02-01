# -*- coding: utf-8 -*-
require 'spec_helper'
require 'pry'
describe NijieroGazou do
  let(:url) { 'http://niziero.blog.jp/archives/2633761.html' }
  subject { @dl }

  before do
    FileUtils.stub(:mkdir_p)
    @dl = described_class.new(url)
    fake(:get, url, 'nijiero_gazou/sample.html')
  end
  its(:name) { should == '二次エロ画像速報' }
  its(:title) { should == '二次エロ画像速報 : 人気絶頂！艦隊これくしょん（艦これ）の二次エロ画像【４０枚】　その４８' }
  its(:base_dir) { should == 'nijiero_gazou' }

  its(:sub_directory) { should == '艦隊これくしょん/2633761' }
  its("targets.count") { should == 40 }

  its(:prev) { should == 'http://niziero.blog.jp/archives/2633702.html' }
  its(:next) { should == 'http://niziero.blog.jp/archives/2670435.html' }

end
