require 'thor/group'

module Toppings
  module Generators
    class ModuleGenerator < Thor::Group
      include Thor::Actions
      include Toppings::Helper::PathHelper

      argument :name
      def module
        #template sass_partial_name(file), base_path.join(sass_partial_name(file))
        #append_import file, base_file_path if append
      end


      private

      def self.source_root
        template_path
      end

    end
  end
end
