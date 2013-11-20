# encoding: utf-8
require 'spec_helper'

describe Toppings::Generators::StructuresGenerator do
  context 'generating a font fubar' do
    with_args 'component' do

      # TODO: this test should be moved and adjusted in structure/component_generator scope
      # with_args 'fubar' do
      #  it 'should generate a component css file called _fubar.sass' do
      #    subject.should generate(stylesheets_path.join('components/_fubar.sass')) { |content|
      #      content.should include('.m-fubar')
      #    }
      #  end
      # end

      with_args 'ganimed' do
        it 'should append a new component to the components base file' do
          subject.should generate(stylesheets_path.join('components/_ganimed.sass')) {
            File.read(stylesheets_path.join('components/_index.sass')).should =~ /\@import \"ganimed\"/
          }
        end
      end

    end

    context 'generating a setting fubar' do
      with_args 'setting' do
        with_args 'fubar' do
          it 'should generate a settings css file called _fubar.sass' do
            subject.should generate(stylesheets_path.join('settings/_fubar.sass'))
          end
        end

        with_args 'fubar' do
          it 'should append a new settings file to the settings base file' do
            subject.should generate(stylesheets_path.join('settings/_fubar.sass')) {
              File.read(stylesheets_path.join('settings/_index.sass')).should =~ /\@import \"fubar\"/
            }
          end
        end
      end
    end
  end
end
