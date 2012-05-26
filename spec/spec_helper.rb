$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rspec'
require 'ero_getter'
require 'fakeweb'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|

end

def fake(method, url, file)
  FakeWeb.register_uri(method, url, :body => File.read(sample_path(file)))
end

def sample_path(file)
  File.join(File.dirname(__FILE__), 'samples', file)
end
