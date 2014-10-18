$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'coveralls'
Coveralls.wear!
require 'ero_getter'
require 'webmock/rspec'
require 'pry'
require 'pry-doc'

RSpec.configure do |config|
  Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }
  config.before do
    allow(FileUtils).to receive(:mkdir_p).and_return(true)
  end
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
