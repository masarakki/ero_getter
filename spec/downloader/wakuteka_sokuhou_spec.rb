# -*- coding: utf-8 -*-
require 'spec_helper'

downloader WakutekaSokuhou do
  let(:url) { 'http://blog.livedoor.jp/wakusoku/archives/1461175.html' }
  let(:name) { 'わくてか速報' }
  let(:title) { 'わくてか速報 : 【エロ画像】抜かずにはいられない虹エロ画像パート１１９４【詳細付き】 - livedoor Blog（ブログ）' }
  let(:base_dir) { 'wakuteka_sokuhou' }
  let(:sub_directory) { '1461175' }
  let(:count) { 37 }
  let(:first_image_url) { 'http://livedoor.blogimg.jp/wakusoku/imgs/b/d/bda97b8d.jpg' }
end
