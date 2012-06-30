# -*- coding: utf-8 -*-
class ElogBakufu < EroGetter::Base

  name 'エログ幕府'
  url %r{http://blog.livedoor.jp/samplems-bakufu/archives/\d+.html}

  target ".article-body-inner img" do |path|
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
