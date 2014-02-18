# -*- coding: utf-8 -*-
require 'spec_helper'

downloader MinkChannel do
  let(:url) { "http://minkchan.com/blog-entry-3916.html" }
  let(:name) { "みんくちゃんねる" }
  let(:title) { 'マック店内で清純な制服JKの行儀悪いむっちり太もも晒し撮りうｐ - みんくちゃんねる' }
  let(:base_dir) { 'mink_channel' }
  let(:sub_directory) { '2-3916' }
  let(:count) { 15 }
  let(:first_image_url) { "http://blog-imgs-47.fc2.com/m/i/n/minkch/i_20130705160606.jpg" }
end
