class EroGetter::Utils
  class << self
    def mkdir(path)
      unless File.exists?(path)
        basedir = File.dirname(path)
        mkdir(basedir) unless File.exists?(basedir)
        Dir.mkdir(path)
      end
    end
  end
end
