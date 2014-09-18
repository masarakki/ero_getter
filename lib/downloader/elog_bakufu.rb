# -*- coding: utf-8 -*-
class ElogBakufu < EroGetter::Livedoor
  name 'エログ幕府'
  url %r{http://bakufu.jp/archives/\d+}

  target 'a > img.size-thumbnail' do |path|
    path.parent[:href]
  end

  sub_directory do
    url.match(/(\d+)/)[1]
  end

  filename { |attr| format('%04d%s', attr[:index], attr[:ext]) }
end
