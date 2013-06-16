require 'thor/group'

module Toppings
  module Generators
    class ModuleGenerator < Thor::Group
      include Thor::Actions
      include Toppings::Helper::PathHelper
      include Toppings::Helper::BaseFileHelper

      argument :name
      def create_module_file
        template sass_partial_name('module', :erb), base_path.join(sass_partial_name(name))
        # TODO: create appender
        #append_import file, base_file_path if append
      end

      private

      def self.source_root
        template_path
      end

    end
  end
end
