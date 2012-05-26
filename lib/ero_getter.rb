class EroGetter
  autoload :Base, 'ero_getter/base'
  autoload :Utils, 'ero_getter/utils'

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

    def mkdir(path)
      unless File.exists?(path)
        basedir = File.dirname(path)
        mkdir(basedir) unless File.exists?(basedir)
        Dir.mkdir(path)
      end
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
