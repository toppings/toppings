# encoding: utf-8
require 'spec_helper'

class RegistrationTestGenerator < Thor::Group
  include Toppings::Helper::GeneratorRegistrationHelper

  def run_registered_generators
    registered_generators.each { |generator| generator.start }
  end
end

describe RegistrationTestGenerator do

  context 'as a generator registry' do

    context 'with a proper registration management' do
      around do
        subject.generators.clear
      end

      subject { Toppings::Generators::InstallGenerator }

      describe 'upfront the list of registered generators' do
        it { subject.generators.should be_empty }
      end

      describe 'by adding a generator, the generator list' do
        before do
          subject.register TestGenerator
        end

        it { subject.generators.should include(TestGenerator) }
      end
    end


    context 'with registered generators' do
      within_source_root do |tempdir|
        create_stylesheets_folder(tempdir)
        create_dummy_root_file(tempdir)
      end

      before do
        RegistrationTestGenerator.register Toppings::Generators::Install::HelperGenerator,
                                           Toppings::Generators::Install::ModulesGenerator
      end

      it('should install the registered generators') {
        subject.should generate(stylesheets_path.join("helper/_#{Toppings.conf.stylesheets.relative_index_file}.sass"))
        subject.should generate(stylesheets_path.join("modules/_#{Toppings.conf.stylesheets.relative_index_file}.sass"))
      }
    end

  end

end
