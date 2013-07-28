# encoding: utf-8
require 'spec_helper'

describe Toppings::Generators::InstallGenerator do
  context 'as the toppings generator registry' do
    describe 'with all install generators registered' do

      it('should generate the templates for the root file') {
        subject.should generate_valid_sass_file(stylesheets_path.join('toppings.sass'))
      }

      it('should generate the templates of each registered generator') {
        subject[:described].generators.each do |generator|
          subject.should generate_index_file('helper')
        end
      }

    end
  end
end

def say(message)
  raise message.inspect
end