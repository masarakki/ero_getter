# -*- coding: utf-8 -*-
class GazouSokuhou < EroGetter::Base
  name 'がぞー速報'
  url %r{http://stalker.livedoor.biz/archives/\d+.html}

  target 'img.pict' do |path|
    if path.parent.name == 'a' && path.parent[:href] =~ /jpe?g|gif|png$/
      path.parent[:href]
    else
      path[:src]
    end
  end

  sub_directory do
    url.match(/(\d+).html/)[1]
  end

  filename { |attr| format('%04d%s', attr[:index], attr[:ext]) }
end
