# -*- coding: utf-8 -*-
require 'spec_helper'

describe EroGetter::Livedoor do
  subject { @klass }
  before do
    @klass = Class.new(EroGetter::Livedoor) do
      name 'てすと'
      blog_id 'hoge'
    end
  end
  it { expect(subject.instance_methods).to be_include :url_regex }
  it { expect { subject.new('http://blog.livedoor.jp/hoge/archives/101010.html') }.not_to raise_error }
end
