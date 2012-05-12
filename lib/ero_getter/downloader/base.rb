require 'active_support/inflector'
require 'httpclient'
require 'nokogiri'

class EroGetter::Downloader::Base
  def initialize(url)
    raise unless url.match url_regex
    @url = url
  end

  def base_dir
    self.class.to_s.underscore
  end

  def http_client
    @http_client ||= HTTPClient.new
  end

  class << self
    def name(site_name)
      define_method(:name) do
        site_name
      end
    end

    def url(regex)
      define_method(:url_regex) do
        regex
      end
      EroGetter.add_mapping(regex, self)
    end
  end

  def url
    @url
  end

  def document
    @document ||= Nokogiri::HTML(open(url).read)
  end

  def title
    @title ||= document.title
  end
end
