# encoding: utf-8
require 'spec_helper'

describe Toppings::Helper::IndexFileHelper do
  subject { Toppings::SomeNameSpace::IndexFileHelperGenerator.new }

  context 'for sass content usage' do
    describe 'we want to have a generic base file for each component group' do
      it { subject.send(:index_file_name).should eq('_index.sass') }
    end

    describe 'we want to have a short hand for a base file inside our base path' do
      it { subject.send(:index_file_path).to_s.should eq('stylesheets/index_file_helper/_index.sass') }
    end

    describe 'we want to have a group base path without any sass file naming relative to the root_file' do
      it { subject.send(:relative_index_name).to_s.should eq('index_file_helper/index') }
    end
  end
end


module Toppings::SomeNameSpace
  class IndexFileHelperGenerator
    include Toppings::Helper::IndexFileHelper
  end
end