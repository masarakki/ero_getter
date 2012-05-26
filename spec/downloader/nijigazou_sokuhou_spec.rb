# -*- coding: utf-8 -*-
require 'spec_helper'

describe NijigazouSokuhou do
  let(:url) { 'http://nijigazo.2chblog.jp/archives/52249806.html' }
  subject { @dl }

  context :sample do
    before do
      EroGetter.stub(:mkdir)
      @dl = NijigazouSokuhou.new(url)
      @dl.stub(:document).and_return(Nokogiri::HTML(File.open(sample_path('nijigazou_sokuhou/middle.html'))))
    end

    its(:name) { should == '二次画像速報' }
    its(:title) { should == '二次画像速報 : 【けいおん！】中野梓【あずにゃん】 その2' }
    its(:title_part) { should == '【けいおん！】中野梓【あずにゃん】' }
    its("targets.count") { should == 50 }
    its("targets.first") { should == "http://img03.nijigazo.com/2012/05/11/azusa/0511azusa_0051.jpg" }
    its(:sub_directory) { should == 'azusa/20120511' }
  end

  describe :run do
    before do
      EroGetter.stub(:mkdir)
      @dl = NijigazouSokuhou.new(url)
      @response = Class.new do
        def status ; 200 ; end
        def body ; 'test' ; end
      end.new
      @dummy_next = Class.new do
        def run ; end
      end.new

      @dl.http_client.stub(:get).and_return(@response)
      File.stub(:open)
      NijigazouSokuhou.stub(:new).and_return(@dummy_next)
    end

    it "get all targets" do
      @dl.http_client.should_receive(:get).exactly(140).and_return(@response)
      @dl.run
    end
  end
end
