require 'rubygems'
require 'spork'
#uncomment the following line to use spork with the debugger
#require 'spork/ext/ruby-debug'

Spork.prefork do
  # Loading more in this block will cause your tests to run faster. However,
  # if you change any configuration or code from libraries loaded here, you'll
  # need to restart spork for it take effect.

  $LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
  $LOAD_PATH.unshift(File.dirname(__FILE__))
  require 'rspec'
  require 'ero_getter'
  require 'webmock/rspec'

  # Requires supporting files with custom matchers and macros, etc,
  # in ./support/ and its subdirectories.
  Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

  RSpec.configure do |config|

    #    FileUtils.stub(:mkdir_p).and_return(true)
  end

  def fake(method, url, file)
    stub_request(method, url).to_return(:body => File.read(sample_path(file)))
  end

  def sample_path(file)
    File.join(File.dirname(__FILE__), 'samples', file)
  end

end

Spork.each_run do

end
