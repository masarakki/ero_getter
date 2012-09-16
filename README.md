EroGetter [![Build Status](https://secure.travis-ci.org/masarakki/ero_getter.png)](http://travis-ci.org/masarakki/ero_getter) [![Dependency Status](https://gemnasium.com/masarakki/ero_getter.png)](http://gemnasium.com/masarakki/ero_getter)
=========

ero_getter is downloader for ero gazou.

usage
-----
 EroGetter.download(url)

automaticaly download in $HOME/ero_getter/#{site}/#{sub_directory}/

support other sites
-------------------

add lib/downloader/#{site_name}.rb

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

make directory spec/samples/#{site_name}
and download sample of html source in spec/sample/#{site_name}/sample.html

add spec/downloader#{site_name}_spec.rb

    require 'spec_helper'
    describe #{SiteName} do
      subject { @dl }
      let(:url) { 'http://example.com/archives/01010101.html' }
      before do
        FileUtils.stub(::mkdir_p)
        @dl = #{SiteName}.new(url)
        fake(:get, url, '#{site_name}/sample.html')
      end
      its(:sub_directory) { should == '01010101' }
      its("targets.count") { should == #{numbers of image} }
    end

then pull request!

see also
--------
http://github.com/masarakki/ero_getter_server

Contributing to ero_getter
--------------------------

* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

Copyright
---------

Copyright (c) 2012 masarakki. See LICENSE.txt for
further details.

