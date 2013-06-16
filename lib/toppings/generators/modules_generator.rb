require 'thor/group'

module Toppings
  module Generators
    class ModulesGenerator < Thor::Group
      include Thor::Actions
      include Toppings::Helper::PathHelper
      include Toppings::Helper::BaseFileHelper

      argument :name
      def create_module_file
        template sass_partial_name('module', :erb), base_path.join(sass_partial_name(name))
        create_file base_file_path, skip: true
        append_import name, base_file_path
      end

      private

      def self.source_root
        template_path
      end

    end
  end
end
