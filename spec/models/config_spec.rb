# encoding: utf-8
require 'spec_helper'

describe Toppings::Config do
  context 'as a container for attributes' do
    context 'with some attributes assigned' do
      subject { Toppings::Config.new attr1: 'fu' }

      describe 'asking for attr1' do
        it { subject.attr1.should eq('fu') }
      end

      describe 'setting a new attribute attr2' do
        it { subject.attr2=('bar').should eq('bar') }
      end
    end

    context 'with nested configuration attributes' do
      subject { Toppings::Config.new attr1: { attr2: 'fubar' } }

      describe 'asking for the nested attribute attr2' do
        it { subject.attr1.attr2.should eq('fubar') }
      end
    end
  end

  context 'for the class itself' do
    subject { Toppings::Config }

    context 'having a default config' do
      before do
        subject.stub(:gem_config_path).and_return test_config_path
      end

      describe 'provided at a default config path in the gem folder' do
        it { subject.default_config_path.should eq(test_config_path.join('default.json')) }
      end

      describe 'asked for a non existing option, the option ...' do
        it { subject.load.tyrion_lannister.should be_nil }
      end

      describe 'asked for the sass options, nested options ...' do
        it { subject.load.sass.should be_kind_of(Toppings::Config) }
      end

      describe 'having a sass dialect configuration' do
        it { subject.load.sass.dialect.should eq('sass') }
      end

      describe 'having a stylesheet root file configuration' do
        it { subject.load.stylesheets.root_file.should eq('toppings') }
      end
    end

    context 'having a default config and an application config' do
      before do
        subject.stub(:gem_config_path).and_return test_config_path
        subject.stub(:app_config_path).and_return test_config_path
      end

      describe 'having a sass dialect configuration without providing it in the custom config' do
        it { subject.load.sass.dialect.should eq('sass') }
      end

      describe 'having a stylesheet root file configuration' do
        it { subject.load.stylesheets.root_file.should eq('toppings_custom') }
      end

      describe "with a new option 'new_option'" do
        it { subject.load.new_option.should eq('something') }
      end
    end

  end
end
