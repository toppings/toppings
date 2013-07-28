# encoding: utf-8
require 'spec_helper'

describe Toppings::Generators::Install::HelperGenerator do

  within_source_root do |tempdir|
    create_stylesheets_folder(tempdir)
    create_dummy_root_file(tempdir)
  end

  context 'as a group of stylesheets' do
    it 'should provide a relative base file' do
      subject.should generate_index_file('helper')
    end
  end

  context 'providing some useful helper files' do
    describe 'a debug helper' do
      it 'should be created' do
        subject.should generate_valid_sass_file(stylesheets_path.join('helper/_debug.sass')) { |content|
          content.should include('$debug-color: #fff')
        }
      end
    end
  end

end
