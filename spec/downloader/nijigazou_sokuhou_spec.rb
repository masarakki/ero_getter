# -*- coding: utf-8 -*-
require 'spec_helper'

downloader NijigazouSokuhou do
  let(:url) { 'http://nijigazo.2chblog.jp/archives/52249806.html' }
  let(:name) { '二次画像速報' }
  let(:title) { '二次画像速報 : 【けいおん！】中野梓【あずにゃん】 その2' }
  let(:count) { 50 }
  let(:first_image_url) { 'http://img03.nijigazo.com/2012/05/11/azusa/0511azusa_0051.jpg' }
  let(:base_dir) { 'nijigazou_sokuhou' }
  let(:sub_directory) { 'azusa/20120511' }

  let(:prev_url) { 'http://nijigazo.2chblog.jp/archives/52249804.html' }
  let(:next_url) { 'http://nijigazo.2chblog.jp/archives/52249808.html' }
end
