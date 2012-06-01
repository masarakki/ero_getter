# -*- coding: utf-8 -*-
require 'spec_helper'

describe GazouSokuhou do
  let(:url) { 'http://stalker.livedoor.biz/archives/51977311.html' }
  subject { @dl }

  before do
    EroGetter.stub(:mkdir)
    @dl = GazouSokuhou.new(url)
    fake(:get, url, 'gazou_sokuhou/sample.html')
  end
  its(:name) { should == 'がぞー速報' }
  its(:title) { should == '6月になったし2次水着画像どんどん貼ってくよー  -  がぞ～速報' }
  its(:base_dir) { should == 'gazou_sokuhou' }
  its(:sub_directory) { should == '51977311' }
  its("targets.count") { should == 31 }
end
