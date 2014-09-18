require 'spec_helper'

describe EroGetter do
  subject { EroGetter }
  before do
    EroGetter.clean
  end

  let(:regex) { %r{http://example.com/\d+.html} }
  describe 'class methods' do
    describe '.url_mapping' do
      it { expect(subject.url_mapping).to eq({}) }
      context 'add mapping' do
        before do
          @strategy = Class.new
          @regex = regex
          EroGetter.add_mapping(@regex, @strategy)
        end
        it { expect(subject.url_mapping).to eq(@regex =>  @strategy) }
      end
    end
  end

  describe 'instance methods' do
    let(:url) { 'http://example.com/0101010.html' }
    before do
      @strategy = Class.new
      @regex = regex
      EroGetter.add_mapping(@regex, @strategy)
    end

    describe '#detect' do
      context 'url matches to regex' do
        it { expect(subject.detect(url)).to eq @strategy }
      end
      context 'url mismatches to regex' do
        it { expect(subject.detect(url.gsub(/com/, 'net'))).to be_nil }
      end
    end

    describe '#download' do
      context 'url matches to regex' do
        it 'detect and run' do
          @instance = @strategy.new
          expect(@strategy).to receive(:new).with(url).and_return(@instance)
          expect(@instance).to receive(:run)
          subject.download(url)
        end
      end

      context 'url mismatches to regex' do
        it { expect { subject.download(url.gsub(/com/, 'net')) }.to raise_error }
      end
    end
  end
end
