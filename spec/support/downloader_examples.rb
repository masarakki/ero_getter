# -*- coding: utf-8 -*-

shared_examples :downloader do
  let(:url) { 'http://niziero.blog.jp/archives/2633761.html' }
  let(:dl) { described_class.new(url) }

  describe "EroGetter.detect" do
    it { expect(EroGetter.detect(url)).to eq described_class }
  end

  describe ".base_dir" do
    it { expect(described_class.base_dir).to eq base_dir }
  end

  shared_examples :sample_examples do
    describe "#name" do
      it { expect(dl.name).to eq name }
    end
    describe "#title" do
      it { expect(dl.title).to eq title }
    end
    describe "#sub_directory" do
      it { expect(dl.sub_directory).to eq sub_directory }
    end
    describe "#targets" do
      describe "#first" do
        it { expect(dl.targets.first).to eq first_image_url }
      end
      describe "#count" do
        it { expect(dl.targets.count).to eq count }
      end
    end
  end

  shared_examples :first_examples do
    describe "#prev" do
      it { expect(dl.prev).to be_nil }
    end
    describe "#next" do
      it { expect(dl.next).not_to be_nil }
    end
  end

  shared_examples :middle_examples do
    it_behaves_like :sample_examples
    describe "#prev" do
      it { expect(dl.prev).to eq prev_url }
    end
    describe "#next" do
      it { expect(dl.next).to eq next_url }
    end
  end

  shared_examples :last_examples do
    describe "#prev" do
      it { expect(dl.prev).not_to be_nil }
    end
    describe "#next" do
      it { expect(dl.next).to be_nil }
    end
  end

  shared_examples :global_last_examples do
    describe "#next" do
      it { expect(dl.next).to be_nil }
    end
  end

  Dir.glob("spec/samples/#{described_class.base_dir}/{first,middle,last,sample,global_last}.html").each do |file|
    type =  File.basename(file, '.html')
    it_behaves_like "#{type}_examples".to_sym do
      before do
        stub_request(:get, url).to_return(:body => File.read(sample_file))
      end
      let(:sample_file) { file }
    end
  end
end

def downloader(klass, &block)
  describe klass do
    it_behaves_like :downloader, &block
  end
end
