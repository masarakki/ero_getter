# -*- coding: utf-8 -*-
require 'spec_helper'

downloader ElogBakufu do
  let(:url) { 'http://bakufu.jp/archives/7955' }
  let(:name) { 'エログ幕府' }
  let(:title) { '見えそうで見えないのが最高にいい生ＪＫの画像 part8 | お宝エログ幕府' }
  let(:base_dir) { 'elog_bakufu' }
  let(:sub_directory) { '7955' }
  let(:count) { 40 }
  let(:first_image_url) { "http://bakufu.jp/wp-content/uploads/2013/06/130621d_0001.jpg" }
end
