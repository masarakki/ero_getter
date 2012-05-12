require 'spec_helper'

describe EroGetter do
  subject { @ero_getter }
  describe :class_methods do
    subject { EroGetter }
    describe :url_mapping do
      its(:url_mapping) { should == {} }
      context :add_mapping do
        before do
          @strategy = Class.new
          @regex = %r{http://example.com/[0-9].html}
          EroGetter.add_mapping(@regex, @strategy)
        end
        its(:url_mapping) { should == {@regex =>  @strategy} }
      end
    end
  end
end
