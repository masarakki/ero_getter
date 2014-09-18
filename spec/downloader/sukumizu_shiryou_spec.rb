# -*- coding: utf-8 -*-
require 'spec_helper'

downloader SukumizuShiryou do
  let(:url) { 'http://iieshiryoudesu.blog96.fc2.com/blog-entry-2720.html' }
  let(:name) { 'スク水大好き!?いいえ資料です' }
  let(:title) { 'エロ画像jpg】騎乗位セックスエロ画像　下から突き上げられて快楽におぼれる女の子がエロイ スク水大好き?いいえ資料です。' }
  let(:base_dir) { 'sukumizu_shiryou' }
  let(:sub_directory) { '2720' }
  let(:count) { 30 }
  let(:first_image_url) { 'http://blog-imgs-44-origin.fc2.com/i/i/e/iieshiryoudesu/201111221804463d7.jpg' }
end
