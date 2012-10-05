# -*- coding: utf-8 -*-
class OnaNeet < EroGetter::Base

  name "オナニート速報"
  url %r{http://onaneet.com/archives/(\d+).html}

  target ".article-body-inner img.pict" do |path|
    if path.parent[:href] =~ /jpe?g|png|gif$/
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
