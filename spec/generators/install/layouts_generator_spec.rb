# encoding: utf-8
require 'spec_helper'

describe Toppings::Generators::Install::LayoutsGenerator do

  within_source_root do |tempdir|
    create_stylesheets_folder(tempdir)
    create_dummy_root_file(tempdir)
  end

  context 'as a group of stylesheets' do
    it 'should provide a relative base file' do
      subject.should generate(stylesheets_path.join("layouts/_#{Toppings.conf.stylesheets.relative_index_file}.sass"))
    end
  end

end
