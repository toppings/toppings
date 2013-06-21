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
        template rescued_sass_partial(type), base_path.join(sass_file_name(name, partial: true))
        create_file base_file_path, skip: true
        append_import name, base_file_path
      end

      private

      def rescued_sass_partial(type)
        File.exists?(self.class.source_root.join(erb_template(type))) ?
            erb_template(type) : default_template
      end

      def erb_template(type)
        sass_file_name(type, type: :erb, partial: true)
      end

      def default_template
        sass_file_name('default', type: :erb, partial: true)
      end

      class << self
        def source_root
          template_path.join('components')
        end
      end

    end
  end
end
