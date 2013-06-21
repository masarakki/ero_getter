# -*- coding: utf-8 -*-
class ElogBakufu < EroGetter::Livedoor #EroGetter::Base

  name 'エログ幕府'
  url %r{http://bakufu.jp/archives/\d+}

  sub_directory do
    url.match(/(\d+)/)[1]
  end

  filename { |attr| "%04d%s" % [attr[:index], attr[:ext]] }

end
