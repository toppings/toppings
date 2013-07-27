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

      def notify_invoke
        say 'invoke InstallGenerator'
      end

      def install_framework_structure
        register_generator :root_file, :fonts, :settings, :helper, :setups, :modules, :layouts, group: 'install'
      end
    end
  end
end
