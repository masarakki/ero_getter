# -*- coding: utf-8 -*-
require 'nokogiri'

class NijigazouSokuhou < EroGetter::Base

  name '二次画像速報'
  url %r{http://nijigazo.2chblog.jp/archives/\d+.html}

  target ".article-body-more > a > img" do |path|
    path.parent[:href] if path.parent[:href] =~ /jpe?g|png|gif$/
  end

  sub_directory do
    path = targets.first.split('/')
    d = path[3..5].join('')
    chara = path[6]
    File.join(chara, d)
  end

  def title_part
    @title_part ||= title.split(/:/).last.match(/(.+?)(その.+)?$/)[1].strip.gsub(/&amp;/, '&')
  end

  def run
    p document
#    connection = {
#      :prev => document.xpath("//a[@rel='prev']").first,
#      :next => document.xpath("//a[@rel='next']").first
#    }

    targets.each do |image_url|
      filename = File.basename(image_url)
      response = http_client.get(image_url, :header => {:referer => src_url})
      raise unless response.status == 200
      File.open(File.join(directory, filename), "wb") {|f| f.write response.body }
    end

#    connection.each do |type, path|
#      if path
#        case type
#        when :prev
#          NijigazouSokuhou.new(path[:href], -1).run if direction <= 0 && path.text.match(Regexp.escape(title_part))
#        when :next
#          NijigazouSokuhou.new(path[:href],  1).run if direction >= 0 && path.text.match(Regexp.escape(title_part))
#        end
#      end
#    end
  end
end
