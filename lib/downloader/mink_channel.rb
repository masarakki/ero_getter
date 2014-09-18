# -*- coding: utf-8 -*-
class MinkChannel < EroGetter::Base
  name 'みんくちゃんねる'
  url %r{http://minkchan.com/blog-entry-(\d+).html}

  target 'img.pict' do |path|
    path.parent[:href] if path.parent.name == 'a' && path.parent[:href] =~ /jpe?g|gif|png$/
  end

  sub_directory do
    '2-' + url.match(/(\d+)\.html/)[1]
  end

  filename { |attr| format('%04d%s', attr[:index], attr[:ext]) }
end
