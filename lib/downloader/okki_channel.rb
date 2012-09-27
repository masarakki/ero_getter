# -*- coding: utf-8 -*-
class OkkiChannel < EroGetter::Base

  name "おっきちゃんねる"
  url %r{http://moegazo.info/archives/(\d+).html}

  target ".article-body-inner a > img" do |path|
    path.parent[:href] if path.parent[:href] =~ /jpe?g|png|gif$/
  end

  sub_directory do
    url.match(/(\d+).html/)[1]
  end

end
