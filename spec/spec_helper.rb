$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'ero_getter'
require 'webmock/rspec'

RSpec.configure do |config|
  Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}
  config.before do
    allow(FileUtils).to receive(:mkdir_p).and_return(true)
  end
end

def fake(method, url, file)
  stub_request(method, url).to_return(:body => File.read(sample_path(file)))
end

def sample_path(file)
  File.join(File.dirname(__FILE__), 'samples', file)
end
