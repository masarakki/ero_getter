# -*- coding: utf-8 -*-
require 'spec_helper'

downloader OkkiChannel do
  let(:url) { 'http://moegazo.info/archives/18023383.html' }
  let(:name) { 'おっきちゃんねる' }
  let(:title) { 'これがまどかが望んだ世界？　【同人】 : おっきちゃんねる　-エロ画像速報-' }
  let(:base_dir) { 'okki_channel' }
  let(:sub_directory) { '18023383' }
  let(:count) { 30 }
  let(:first_image_url) { "http://livedoor.blogimg.jp/sweds-003/imgs/f/5/f50e6b22.jpg" }
end
