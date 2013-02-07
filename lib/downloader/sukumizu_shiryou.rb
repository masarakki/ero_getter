# -*- coding: utf-8 -*-
class SukumizuShiryou < EroGetter::Base
  name 'スク水大好き!?いいえ資料です'
  url %r{http://iieshiryoudesu.blog96.fc2.com/blog-entry-(\d+).html}

  target ".ently_text a > img" do |path|
    path.parent[:href] if path.parent[:href] =~ /jpe?g|png|gif$/
  end

  sub_directory do
    url.match(/(\d+).html/)[1]
  end

  filename { |attr| "%04d%s" % [attr[:index], attr[:ext]] }

end
