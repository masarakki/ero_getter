# -*- coding: utf-8 -*-
require 'spec_helper'

describe OnaNeet do
  let(:url) { 'http://onaneet.com/archives/4988638.html' }
  subject { @dl }

  before do
    @dl = OnaNeet.new(url)
    fake(:get, url, 'ona_neet/sample.html')
  end
  its(:name) { should == 'オナニート速報' }
  its(:title) { should == 'JKのスケブラが好物です : オナニート速報 2chのエロネタ語りまとめ' }
  its(:base_dir) { should == 'ona_neet' }
  its(:sub_directory) { should == '4988638' }
  its("targets.count") { should == 20 }
end
