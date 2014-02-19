# -*- coding: utf-8 -*-
require 'spec_helper'

downloader GazouSokuhou do
  let(:url) { 'http://stalker.livedoor.biz/archives/51977311.html' }
  let(:name) { 'がぞー速報' }
  let(:title) { '6月になったし2次水着画像どんどん貼ってくよー  -  がぞ～速報' }
  let(:base_dir) { 'gazou_sokuhou' }
  let(:sub_directory) { '51977311' }
  let(:count) { 31 }
  let(:first_image_url) { "http://livedoor.blogimg.jp/poor_bugaboo/imgs/3/b/3bcb4c3a.jpg" }
end
