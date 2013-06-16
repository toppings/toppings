require 'thor/group'

module Toppings
  module Generators
    class ComponentsGenerator < Thor::Group
      include Thor::Actions
      include Toppings::Helper::PathHelper
      include Toppings::Helper::BaseFileHelper

      argument :type
      argument :name

      def create_module_file
        self.class.base_name = type.pluralize
        template rescued_sass_partial(type), base_path.join(sass_partial_name(name))
        create_file base_file_path, skip: true
        append_import name, base_file_path
      end

      private

      def rescued_sass_partial(type)
        erb_template = sass_partial_name(type, :erb)
        File.exists?(self.class.source_root.join(erb_template)) ? erb_template : default_template
      end

      def default_template
        sass_partial_name('default', :erb)
      end

      class << self
        def source_root
          template_path.join('components')
        end
      end

    end
  end
end
