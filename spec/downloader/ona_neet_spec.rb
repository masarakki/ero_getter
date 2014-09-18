# -*- coding: utf-8 -*-
require 'spec_helper'

downloader OnaNeet do
  let(:url) { 'http://onaneet.com/archives/4988638.html' }
  let(:name) { 'オナニート速報' }
  let(:title) { 'JKのスケブラが好物です : オナニート速報 2chのエロネタ語りまとめ' }
  let(:base_dir) { 'ona_neet' }
  let(:sub_directory) { '4988638' }
  let(:count) { 20 }
  let(:first_image_url) { 'http://livedoor.blogimg.jp/okazu3ji/imgs/6/d/6d8c960b.jpg' }
end
