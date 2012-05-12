require 'spec_helper'

describe EroGetter do
  let(:regex) { %r{http://example.com/\d+.html} }
  subject { @ero_getter }
  describe :class_methods do
    subject { EroGetter }
    describe :url_mapping do
      its(:url_mapping) { should == {} }
      context :add_mapping do
        before do
          @strategy = Class.new
          @regex = regex
          EroGetter.add_mapping(@regex, @strategy)
        end
        its(:url_mapping) { should == {@regex =>  @strategy} }
      end
    end
  end

  describe :instance_methods do
    before do
      @strategy = Class.new
      @regex = regex
      EroGetter.add_mapping(@regex, @strategy)
      @ero_getter = EroGetter.new
    end
    describe :detect do
      context :match do
        it { subject.detect('http://example.com/0101010.html').should == @strategy }
      end
      context :mismatch do
        it { subject.detect('http://example.net/0101010.html').should be_nil }
      end
    end
  end
end
