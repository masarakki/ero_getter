# -*- coding: utf-8 -*-
class ShimoSoku < EroGetter::Base
  name '下速'
  url %r{http://blog.livedoor.jp/pramo/archives/\d+.html}

  target "img.pict" do |path|
    if path.parent.name == "a" && path.parent[:href] =~ /jpe?g|gif|png$/
      path.parent[:href]
    else
      path[:src]
    end
  end

  sub_directory do
    url.match(/(\d+).html/)[1]
  end

  filename { |attr| "%04d%s" % [attr[:index], attr[:ext]] }

end
