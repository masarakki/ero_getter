class EroGetter
  autoload :Base, 'ero_getter/base'
  autoload :Livedoor, 'ero_getter/livedoor'

  def detect(url)
    self.class.url_mapping.each_pair do |regex, klazz|
      return klazz if url.match regex
    end
    nil
  end

  def download(url)
    klazz = detect(url)
    raise unless klazz
    klazz.new(url).run
  end


  class << self
    def directory
      path = File.join ENV['HOME'], 'ero_getter'
      puts path unless Dir.exists?(path)
      path
    end

    def url_mapping
      @url_mapping ||= {}
    end

    def add_mapping(regex, strategy)
      url_mapping[regex] = strategy
    end

    def clean
      @url_mapping = {}
    end
  end
end

Dir.glob(File.expand_path(File.dirname(__FILE__) + '/downloader/*.rb')) do |file|
  begin
    require file
  rescue
    puts "Load error in #{file}"
  end
end
