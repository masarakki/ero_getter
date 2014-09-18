require 'spec_helper'

describe EroGetter::Base do
  let(:sample_regex) { %r{http://example.net/\d+.html} }
  let(:url) { 'http://example.net/10101010.html' }
  subject { @dl }

  context 'without connection' do
    before do
      stub_request(:get, url).to_return(body: File.read('spec/samples/sample.html'))
      regex = sample_regex
      @klazz = Class.new(EroGetter::Base) do
        name 'NijiEro BBS'
        url regex

        target 'ul#sources li a' do |elm|
          elm[:href]
        end

        sub_directory do
          targets.map { |x| x.split(%r{/}).last }.join('/')
        end
      end
      allow(@klazz).to receive(:to_s) { 'TestClass' }
    end
    describe 'class methods' do
      subject { @klazz }
      it { expect(subject.site_name).to eq 'NijiEro BBS' }
      it { expect(subject.base_dir).to eq 'test_class' }
    end

    describe 'assign url_mapping' do
      it { expect(EroGetter.url_mapping).to have_key sample_regex }
      it { expect(EroGetter.url_mapping[sample_regex]).to eq @klazz }
    end

    describe 'instance methods' do
      context 'good' do
        before do
          @dl = @klazz.new(url)
          allow(FileUtils).to receive(:mkdir_p) { true }
          allow(EroGetter).to receive('directory') { '/tmp' }
        end
        it { expect(subject.name).to eq 'NijiEro BBS' }
        it { expect(subject.url_regex).to eq sample_regex }
        it { expect(subject.http_client).to be_a HTTPClient }
        it { expect(subject.document).to be_a Nokogiri::HTML::Document }
        it { expect(subject.title).to eq 'EroGetter Server' }
        it { expect(subject.url).to eq url }
        it { expect(subject.direction).to eq :none }
        it { expect(subject.targets).to eq ['https://github.com/masarakki/ero_getter_server', 'https://github.com/masarakki/ero_getter_chrome_extension'] }
        it { expect(subject.sub_directory).to eq 'ero_getter_server/ero_getter_chrome_extension' }
        it { expect(subject.directory).to eq '/tmp/test_class/ero_getter_server/ero_getter_chrome_extension' }
        it { expect(subject.send(:fullpath, 'hogehoge.jpg', 1)).to eq 'hogehoge.jpg' }

        describe 'after run' do
          context 'not set after' do
            it { is_expected.not_to be_run_next }
            it { is_expected.not_to be_run_prev }
          end

          context 'direction none' do
            context 'has next' do
              before do
                allow(@dl).to receive(:next) { 'hoge' }
              end
              it { is_expected.to be_run_next }
              it { is_expected.not_to be_run_prev }
            end
            context 'has prev' do
              before do
                allow(@dl).to receive(:prev) { 'hoge' }
              end
              it { is_expected.not_to be_run_next }
              it { is_expected.to be_run_prev }
            end
            context 'has next and prev' do
              before do
                allow(@dl).to receive(:prev) { 'hoge' }
                allow(@dl).to receive(:next) { 'hoge' }
              end
              it { is_expected.to be_run_next }
              it { is_expected.to be_run_prev }
            end
          end

          context 'direction prev' do
            before do
              allow(@dl).to receive(:direction) { :prev }
            end
            context 'has next' do
              before do
                allow(@dl).to receive(:next) { 'hoge' }
              end
              it { is_expected.not_to be_run_next }
            end
          end

          context 'direction next' do
            before do
              allow(@dl).to receive(:direction).and_return(:next)
            end
            context 'has pref' do
              before do
                allow(@dl).to receive(:prev).and_return('hoge')
              end
              it { is_expected.not_to be_run_prev }
            end
          end
        end
      end

      context 'url mismatch' do
        it { expect { @klazz.new('http://example.com/10101010.html') }.to raise_error }
      end
    end
  end

  describe 'connection' do
    before do
      regex = sample_regex
      klazz = Class.new(EroGetter::Base) do
        url regex

        connection ['a[rel=prev]', 'a[rel=next]'] do |path|
          path
        end
      end
      @dl = klazz.new(url)
      allow(@dl).to receive(:document).and_return(double)
    end

    context 'css_not_found' do
      before do
        allow(@dl.document).to receive(:css).and_return([])
      end
      it { expect(subject.prev).to be_nil }
      it { expect(subject.next).to be_nil }
    end
    context 'css_find_but_invalid' do
      before do
        allow(@dl.document).to receive(:css) { [false, true, true] }
      end
      it { expect(subject.prev).to be_nil }
      it { expect(subject.next).to be_nil }
    end
    context 'css_find_and_valid' do
      before do
        x = { href: 'unko' }
        allow(@dl.document).to receive(:css) { [x] }
      end
      it { expect(subject.prev).to eq 'unko' }
      it { expect(subject.next).to eq 'unko' }
    end
  end
  context 'with_filename' do
    before do
      regex = sample_regex
      klazz = Class.new(EroGetter::Base) do
        url regex
        filename do |attr|
          format('%04d%s', attr[:index], attr[:ext])
        end
      end
      @dl = klazz.new(url)
    end
    it { expect(@dl.send(:fullpath, 'hogehoge.jpg', 0)).to eq '0000.jpg' }
  end
end
