require "ero_getter/version"

class EroGetter
  autoload :Downloader, 'ero_getter/downloader'

  class << self
    def url_mapping
      @@url_mapping ||= {}
    end
    def add_mapping(regex, strategy)
      url_mapping[regex] = strategy
    end
  end
end
