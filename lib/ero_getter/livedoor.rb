class EroGetter
  class Livedoor < Base
    class << self
      def blog_id(id)
        self.url Regexp.new("http://blog.livedoor.jp/#{id}/archives/\\d+.html")
      end
    end

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
end

