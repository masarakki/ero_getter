class EroGetter
  autoload :Downloader, 'ero_getter/downloader'

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
    def url_mapping
      @url_mapping ||= {}
    end
    def add_mapping(regex, strategy)
      url_mapping[regex] = strategy
    end
  end
end
