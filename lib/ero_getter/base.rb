require 'active_support/inflector'
require 'httpclient'
require 'nokogiri'
require 'open-uri'
require 'zipruby'

class EroGetter::Base
  def initialize(url, direction = :none)
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
      EroGetter.mkdir(@dir)
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

  def run
    targets.each_with_index do |target_url, index|
      if target_url =~ /.*\.zip$/
        save_zip(target_url, index)
      else
        save_image(target_url, index)
      end
    end
    self.class.new(self.prev, :prev).run if run_prev?
    self.class.new(self.next, :next).run if run_next?
  end

  def get_target(target)
    response = http_client.get(target, :header => {:referer => url}, :follow_redirect => true)
    raise unless response.status == 200
    response
  end

  def save_image(target_url, index)
    _filename = filename(File.basename(target_url), index)
    response = get_target(target_url)
    File.open(File.join(directory, _filename), "wb") {|f| f.write response.body }
  end

  def save_zip(target_url, index)
    response = get_target(target_url)
    unzip(response.body).each do |_filename, data|
      File.open(File.join(directory, _filename), "wb") {|f| f.write data }
    end
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
      define_singleton_method(:site_name) do
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

    def connection(css, &block)
      [:prev, :next].each_with_index do |method_name, index|
        var_name = "@#{method_name}".to_sym
        define_method(method_name) do
          unless instance_variable_defined?(var_name)
            tag = document.css(css[index]).first
            instance_variable_set(var_name,
              tag && instance_exec(tag, &block) ? tag[:href] : nil)
          end
          instance_variable_get(var_name)
        end
      end
    end

    def filename(&block)
      define_method(:_filename) do |attr|
        yield(attr)
      end
    end
  end

  private
  def run_next?
    direction != :prev && respond_to?(:next) && self.next != nil
  end

  def run_prev?
    direction != :next && respond_to?(:prev) && self.prev != nil
  end

  def filename(basename, index)
    if respond_to?(:_filename)
      _filename(:index => index, :basename => basename, :ext => File.extname(basename))
    else
      basename
    end
  end
end
