# -*- coding: utf-8 -*-
require 'spec_helper'

downloader PmStyle do
  let(:url) { 'http://mxserver08.net/new_pm/main/movie13716.html' }
  let(:name) { "PM Style" }
  let(:title) { "盗撮痴漢ＰＭスタイル" }
  let(:base_dir) { 'pm_style' }
  let(:sub_directory) { 'pm_chu_003056' }
  let(:count) { 3 }
  let(:first_image_url) { 'http://hpcgi2.nifty.com/r-seven/page.cgi?file=copy2/pm/130206/pm_chu3056a.zip' }
end

