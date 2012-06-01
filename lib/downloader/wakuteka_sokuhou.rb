# -*- coding: utf-8 -*-
class WakutekaSokuhou < EroGetter::Base

  name 'わくてか速報'
  url %r{http://blog.livedoor.jp/wakusoku/archives/(\d+).html}

  target ".article-body-inner a > img" do |path|
    path.parent[:href] if path.parent[:href] =~ /jpe?g|gif|png$/
  end

  sub_directory do
    url.match(/(\d+)\.html/)[1]
  end
end