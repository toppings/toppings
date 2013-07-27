# encoding: utf-8
require 'spec_helper'

describe Toppings::Helper::BaseFileHelper do

  context 'providing a naming convention for the toppings install generators' do
    context 'on class level' do
      subject { Toppings::SomeNameSpace::BaseFileHelperGenerator }

      describe 'it should be based on the class name without the module space' do
        it { subject.stripped_class_name.should eq('BaseFileHelperGenerator') }
      end

      describe 'the base name should not carry the generator postfix with it' do
        it { subject.base_name.should eq('base_file_helper') }
      end

      describe 'the base name should be adjustable for dynamic components' do
        it {
          subject.base_name = 'fubar'
          subject.base_name.should eq('fubar')
        }

        after do
          subject.base_name = 'base_file_helper'
        end
      end
    end

    context 'for instances' do
      subject { Toppings::SomeNameSpace::BaseFileHelperGenerator.new }

      describe 'the base name should be available' do
        it { subject.send(:base_name).should eq('base_file_helper') }
      end
    end

  end

  context 'providing some file path helpers based on our naming conventions' do
    subject { Toppings::SomeNameSpace::BaseFileHelperGenerator.new }

    describe 'we want to have a folder path aligned to our naming convention for each component' do
      it { subject.send(:relative_base_path).to_s.should eq('base_file_helper') }
    end

    describe 'we want to have a short link to a classes related component folder inside of our stylesheets root' do
      it { subject.send(:base_path).to_s.should eq('stylesheets/base_file_helper') }
    end


  end

end

module Toppings::SomeNameSpace
  class BaseFileHelperGenerator
    include Toppings::Helper::BaseFileHelper
    include Toppings::Helper::IndexFileHelper
  end
end