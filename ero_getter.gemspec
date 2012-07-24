# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "ero_getter"
  s.version = "1.3.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["masarakki"]
  s.date = "2012-07-24"
  s.description = "ero getter"
  s.email = "masaki@hisme.net"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    ".document",
    ".rspec",
    ".rvmrc",
    ".travis.yml",
    "Gemfile",
    "Guardfile",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "VERSION",
    "ero_getter.gemspec",
    "lib/downloader/elog_bakufu.rb",
    "lib/downloader/gazou_sokuhou.rb",
    "lib/downloader/mink_channel.rb",
    "lib/downloader/nijigazou_sokuhou.rb",
    "lib/downloader/pm_style.rb",
    "lib/downloader/wakuteka_sokuhou.rb",
    "lib/ero_getter.rb",
    "lib/ero_getter/base.rb",
    "lib/ero_getter/utils.rb",
    "spec/downloader/elog_bakufu_spec.rb",
    "spec/downloader/gazou_sokuhou_spec.rb",
    "spec/downloader/mink_channel_spec.rb",
    "spec/downloader/nijigazou_sokuhou_spec.rb",
    "spec/downloader/pm_style_spec.rb",
    "spec/downloader/wakuteka_sokuhou_spec.rb",
    "spec/ero_getter/base_spec.rb",
    "spec/ero_getter_spec.rb",
    "spec/samples/elog_bakufu/sample.html",
    "spec/samples/gazou_sokuhou/sample.html",
    "spec/samples/mink_channel/sample.html",
    "spec/samples/nijigazou_sokuhou/first.html",
    "spec/samples/nijigazou_sokuhou/global_last.html",
    "spec/samples/nijigazou_sokuhou/last.html",
    "spec/samples/nijigazou_sokuhou/middle.html",
    "spec/samples/pm_style/test.html",
    "spec/samples/sample.html",
    "spec/samples/wakuteka_sokuhou/sample.html",
    "spec/spec_helper.rb"
  ]
  s.homepage = "http://github.com/masarakki/ero_getter"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.24"
  s.summary = "ero getter"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>, [">= 0"])
      s.add_runtime_dependency(%q<httpclient>, [">= 0"])
      s.add_runtime_dependency(%q<zipruby>, [">= 0"])
      s.add_runtime_dependency(%q<nokogiri>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<guard-rspec>, [">= 0"])
      s.add_development_dependency(%q<bundler>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, [">= 0"])
    else
      s.add_dependency(%q<activesupport>, [">= 0"])
      s.add_dependency(%q<httpclient>, [">= 0"])
      s.add_dependency(%q<zipruby>, [">= 0"])
      s.add_dependency(%q<nokogiri>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<guard-rspec>, [">= 0"])
      s.add_dependency(%q<bundler>, [">= 0"])
      s.add_dependency(%q<jeweler>, [">= 0"])
    end
  else
    s.add_dependency(%q<activesupport>, [">= 0"])
    s.add_dependency(%q<httpclient>, [">= 0"])
    s.add_dependency(%q<zipruby>, [">= 0"])
    s.add_dependency(%q<nokogiri>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<guard-rspec>, [">= 0"])
    s.add_dependency(%q<bundler>, [">= 0"])
    s.add_dependency(%q<jeweler>, [">= 0"])
  end
end

