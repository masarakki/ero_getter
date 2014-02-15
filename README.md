# EroGetter [![Build Status](https://secure.travis-ci.org/masarakki/ero_getter.png)](http://travis-ci.org/masarakki/ero_getter) [![Dependency Status](https://gemnasium.com/masarakki/ero_getter.png)](http://gemnasium.com/masarakki/ero_getter)

ero_getter is downloader for ero gazou.

## Installation

Add this line to your application's Gemfile:

    gem 'ero_getter'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ero_getter

## usage

```ruby
EroGetter.download(url)
```

automaticaly download in $HOME/ero_getter/#{site}/#{sub_directory}/

## support other sites

add lib/downloader/#{site_name}.rb

```ruby
class #{SiteName} < EroGetter::Base
  name 'Site Name'
  url %r{http://example.com/archives/(\d+).html}
  target "a > img" do |path|                 # use css selector
    path.parent[:href] =~ /jpe?g|gif|png/    # filter like Array.select
  end
  sub_directory do
    url.match(/(\d+)\.html/)[1]
  end
  filename {|attr| "%04d%s" % [attr[:index], attr[:ext]] }  # if you want sequencial filename
end
```

make directory spec/samples/#{site_name}
and download sample of html source in spec/sample/#{site_name}/sample.html

add spec/downloader#{site_name}_spec.rb

```ruby
require 'spec_helper'
describe #{SiteName} do
  subject { @dl }
  let(:url) { 'http://example.com/archives/01010101.html' }
  before do
    @dl = #{SiteName}.new(url)
    fake(:get, url, '#{site_name}/sample.html')
  end
  its(:sub_directory) { should == '01010101' }
  its("targets.count") { should == #{numbers of image} }
end
```

then pull request!

see also
--------
http://github.com/masarakki/ero_getter_server

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
