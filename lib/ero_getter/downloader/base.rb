require 'active_support/inflector'
require 'httpclient'
require 'nokogiri'

class EroGetter::Downloader::Base
  def initialize(url, direction = 0)
    raise unless url.match url_regex
    @url = url
    @direction = direction
  end

  def base_dir
    self.class.to_s.underscore
  end

  def http_client
    @http_client ||= HTTPClient.new
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

    def target(css_selector, &block)
      define_method(:targets) do
        unless instance_variable_defined?(:@targets)
          items = document.css(css_selector).map do |elm|
            yield(elm)
          end
          instance_variable_set(:@targets, items.compact)
        end
        instance_variable_get(:@targets)
      end
    end
  end

end
