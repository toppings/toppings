# encoding: utf-8
require 'thor/group'

# require related structure generator files
Dir.glob(File.join(Toppings.gem_root, '**', 'structure', '*_generator.rb')).each do |generator|
  require generator
end

module Toppings
  module Generators
    class StructuresGenerator < Thor::Group
      include Thor::Actions
      include Toppings::Helper::PathHelper
      include Toppings::Helper::BaseFileHelper
      include Toppings::Helper::IndexFileHelper

      argument :type
      argument :name

      def create_structure_files
        self.class.base_name = type.pluralize
        structure_or_base_generator(type).start [type, name]
      end

      private

      def structure_or_base_generator(name)
        structure_generator(name) || Toppings::Generators::Structure::BaseGenerator
      end

      def structure_generator(name)
        "Toppings::Generators::Structure::#{name.camelcase}Generator".safe_constantize
      rescue NameError
      end

    end
  end
end
