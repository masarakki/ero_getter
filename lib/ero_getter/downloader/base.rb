require 'active_support/inflector'

class EroGetter::Downloader::Base
  def base_dir
    self.class.to_s.underscore
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
  end
end
