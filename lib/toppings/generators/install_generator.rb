# encoding: utf-8
require 'thor/group'

# require related install generator files
Dir.glob(File.join(Toppings.gem_root, '**', 'install', '*_generator.rb')).each do |generator|
  require generator
end

module Toppings
  module Generators
    class InstallGenerator < Thor::Group
      include Thor::Actions
      include Toppings::Helper::GeneratorRegistrationHelper

      register Toppings::Generators::Install::FontsGenerator,
               Toppings::Generators::Install::SettingsGenerator,
               Toppings::Generators::Install::HelperGenerator,
               Toppings::Generators::Install::SetupsGenerator,
               Toppings::Generators::Install::ModulesGenerator,
               Toppings::Generators::Install::LayoutsGenerator,
               Toppings::Generators::Install::CompassConfigGenerator

      def notify_invoke
        say 'invoke InstallGenerator'
      end

      def create_root_file
        Toppings::Generators::Install::RootFileGenerator.start
      end

      def run_registered_generators
        registered_generators.each { |generator| generator.start }
      end
    end
  end
end
