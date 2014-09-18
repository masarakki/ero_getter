# -*- coding: utf-8 -*-
require 'spec_helper'

downloader NijieroGazou do
  let(:url) { 'http://niziero.blog.jp/archives/2633761.html' }
  let(:name) { '二次エロ画像速報' }
  let(:title) { '二次エロ画像速報 : 人気絶頂！艦隊これくしょん（艦これ）の二次エロ画像【４０枚】　その４８' }
  let(:base_dir) { 'nijiero_gazou' }
  let(:sub_directory) { '艦隊これくしょん/2633761' }
  let(:count) { 40 }
  let(:first_image_url) { 'http://livedoor.blogimg.jp/windair3/imgs/6/9/69110e2c.jpg' }

  let(:prev_url) { 'http://niziero.blog.jp/archives/2633702.html' }
  let(:next_url) { 'http://niziero.blog.jp/archives/2670435.html' }
end
