# -*- coding: utf-8 -*-
require 'spec_helper'

describe NijigazouSokuhou do
  let(:url) { 'http://nijigazo.2chblog.jp/archives/52249806.html' }
  subject { @dl = NijigazouSokuhou.new(url) }

  before do
    fake(:get, url, 'nijigazou_sokuhou/middle.html')
  end

  describe :sample do
    context :first_page do
      before do
        fake(:get, url, 'nijigazou_sokuhou/first.html')
      end

      its(:next) { should == url }
      its(:prev) { should be_nil }
    end

    context :middle do
      before do
        fake(:get, url, 'nijigazou_sokuhou/middle.html')
      end

      its(:name) { should == '二次画像速報' }
      its(:title) { should == '二次画像速報 : 【けいおん！】中野梓【あずにゃん】 その2' }
      its(:title_part) { should == '【けいおん！】中野梓【あずにゃん】' }
      its("targets.count") { should == 50 }
      its("targets.first") { should == "http://img03.nijigazo.com/2012/05/11/azusa/0511azusa_0051.jpg" }
      its(:sub_directory) { should == 'azusa/20120511' }
      its(:prev) { should == 'http://nijigazo.2chblog.jp/archives/52249804.html' }
      its(:next) { should == 'http://nijigazo.2chblog.jp/archives/52249808.html' }
    end

    context :last do
      before do
        fake(:get, url, 'nijigazou_sokuhou/last.html')
      end

      its(:next) { should be_nil }
      its(:prev) { should == url }
    end

    context :global_last do
      before do
        fake(:get, url, 'nijigazou_sokuhou/global_last.html')
      end

      its(:next) { should be_nil }
    end
  end
end
