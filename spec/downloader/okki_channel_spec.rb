# -*- coding: utf-8 -*-
require 'spec_helper'

describe OkkiChannel do
  let(:url) { 'http://moegazo.info/archives/18023383.html' }
  subject { @dl }

  before do
    @dl = OkkiChannel.new(url)
    fake(:get, url, 'okki_channel/sample.html')
  end
  its(:name) { should == 'おっきちゃんねる' }
  its(:title) { should == 'これがまどかが望んだ世界？　【同人】 : おっきちゃんねる　-エロ画像速報-' }
  its(:base_dir) { should == 'okki_channel' }
  its(:sub_directory) { should == '18023383' }
  its("targets.count") { should == 30 }
end
