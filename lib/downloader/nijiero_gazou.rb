# -*- coding: utf-8 -*-
class NijieroGazou < EroGetter::Base
  name '二次エロ画像速報'
  url %r{http://niziero.blog.jp/archives/\d+.html}

  target 'img.pict' do |path|
    if path.parent.name == 'a' && path.parent[:href] =~ /jpe?g|gif|png$/
      path.parent[:href]
    else
      path[:src]
    end
  end

  connection ['a[rel=prev]', 'a[rel=next]'] do |path|
    path.text.match(Regexp.escape(title_part))
  end

  sub_directory do
    category = document.css('dd.article-category').first.text
    dir = url.match(/(\d+).html/)[1]
    "#{category}/#{dir}"
  end

  filename { |attr| format('%04d%s', attr[:index], attr[:ext]) }

  def title_part
    @title_part ||= title.split(/:/).last.match(/(.+?)(【.+枚】.+?)?(その.+)?$/)[1].strip.gsub(/&amp;/, '&')
  end
end
