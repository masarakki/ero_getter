require 'active_support/inflector'
require 'httpclient'
require 'nokogiri'
require 'open-uri'
require 'zipruby'

class EroGetter::Base
  def initialize(url, direction = 0)
    raise unless url.match url_regex
    @url = url
    @direction = direction
  end

  def base_dir
    self.class.to_s.underscore
  end

  def directory
    unless @dir
      @dir = File.join(EroGetter.directory, base_dir, sub_directory)
      EroGetter::Downloader.mkdir(@dir)
    end
    @dir
  end

  def http_client
    @http_client ||= HTTPClient.new
  end

  def url
    @url
  end

  def direction
    @direction
  end

  def document
    @document ||= Nokogiri::HTML(open(url).read)
  end

  def title
    @title ||= document.title
  end

  def unzip(zip_data)
    result = []
    Zip::Archive.open_buffer(zip_data) do |archive|
      archive.num_files.times do |i|
        entry_name = archive.get_name(i)
        archive.fopen(entry_name) do |f|
          result << [f.name, f.read]
        end
      end
    end
    result
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

    def sub_directory(&block)
      define_method(:sub_directory) do
        unless instance_variable_defined?(:@sub_directory)
          instance_variable_set(:@sub_directory, self.instance_eval(&block))
        end
        instance_variable_get(:@sub_directory)
      end
    end
  end

end
