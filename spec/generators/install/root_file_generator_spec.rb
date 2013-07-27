# encoding: utf-8
require 'spec_helper'

describe Toppings::Generators::Install::RootFileGenerator do

  within_source_root do |tempdir|
    create_stylesheets_folder(tempdir)
  end

  context 'as a root stylesheet registration' do
    it 'should provide an absolute base file called toppings' do
      subject.should generate(stylesheets_path.join('toppings.sass'))
    end
  end

  context 'as the dependency loader for all base dependencies' do
    it 'the root base file should include an import statement for each dependency' do
      subject.should generate_valid_sass_file(stylesheets_path.join('toppings.sass')) { |content|
        content.should include('@import "compass"')
        content.should include('@import "compass/css3"')
        content.should include('@import "compass/reset"')
      }
    end
  end

end
