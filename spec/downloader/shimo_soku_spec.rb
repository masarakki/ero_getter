# -*- coding: utf-8 -*-
require 'spec_helper'

downloader ShimoSoku do
  let(:url) { 'http://blog.livedoor.jp/pramo/archives/51867686.html' }
  let(:name) { '下速' }
  let(:title) { '最近暖かくなってきたので、日焼け跡が美しい女の子のエロ画像でも貼りますね : 下速　下ネタ速報' }
  let(:base_dir) { 'shimo_soku' }
  let(:sub_directory) { '51867686' }
  let(:count) { 32 }
  let(:first_image_url) { 'http://livedoor.blogimg.jp/pramo/imgs/f/4/f4d89776.jpg' }
end
