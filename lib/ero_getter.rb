require 'ero_getter/version'
require 'ero_getter/base'
require 'ero_getter/livedoor'

module EroGetter
  def self.directory
    path = File.join ENV['HOME'], 'ero_getter'
    puts path unless Dir.exist?(path)
    path
  end

  def self.url_mapping
    @url_mapping ||= {}
  end

  def self.add_mapping(regex, strategy)
    url_mapping[regex] = strategy
  end

  def self.clean
    @url_mapping = {}
  end

  def self.detect(url)
    url_mapping.each_pair do |regex, klazz|
      return klazz if url.match regex
    end
    nil
  end

  def self.download(url)
    klazz = detect(url)
    fail unless klazz
    klazz.new(url).run
  end
end

Dir.glob(File.expand_path(File.dirname(__FILE__) + '/downloader/*.rb')) do |file|
  begin
    require file
  rescue
    puts "Load error in #{file}"
  end
end
