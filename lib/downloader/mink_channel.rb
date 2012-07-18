# -*- coding: utf-8 -*-
class MinkChannel < EroGetter::Base

  name 'みんくちゃんねる'
  url %r{http://minkch.com/archives/(\d+).html}

  target ".article-body-inner img" do |path|
    path.parent[:href] if path.parent[:href] =~ /jpe?g|gif|png/
  end

  sub_directory do
    url.match(/(\d+)\.html/)[1]
  end

  filename {|attr| "%04d%s" % [attr[:index], attr[:ext]] }

end
