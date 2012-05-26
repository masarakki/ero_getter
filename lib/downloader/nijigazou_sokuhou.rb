# -*- coding: utf-8 -*-
require 'nokogiri'

class NijigazouSokuhou < EroGetter::Base

  name '二次画像速報'
  url %r{http://nijigazo.2chblog.jp/archives/\d+.html}

  target ".article-body-more > a > img" do |path|
    path.parent[:href] if path.parent[:href] =~ /jpe?g|png|gif$/
  end

  sub_directory do
    path = targets.first.split('/')
    d = path[3..5].join('')
    chara = path[6]
    File.join(chara, d)
  end

  after ["//a[@rel='prev']", "//a[@rel='next']"] do |path|
    path.text.match(Regexp.escape(title_part))
  end

  def title_part
    @title_part ||= title.split(/:/).last.match(/(.+?)(その.+)?$/)[1].strip.gsub(/&amp;/, '&')
  end

end
