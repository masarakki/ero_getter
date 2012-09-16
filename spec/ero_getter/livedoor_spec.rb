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
  it { subject.instance_methods.should include :url_regex }
  it do
    lambda {
      subject.new('http://blog.livedoor.jp/hoge/archives/101010.html')
    }.should_not raise_error
  end
end
