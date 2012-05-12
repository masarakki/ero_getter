class EroGetter::Downloader
  autoload :Base, 'ero_getter/downloader/base'

  class << self
    def base_path
      path = File.join(ENV['HOME'], 'ero_getter')
      mkdir(path) unless Dir.exists?(path)
      path
    end

    def mkdir(path)
      basedir = File.dirname(path)
      mkdir(basedir) unless File.exists?(basedir)
      Dir.mkdir(path)
    end
  end
end
