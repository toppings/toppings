# encoding: utf-8
require 'thor/group'

module Toppings
  module Generators
    module Structure
      class BaseGenerator < Thor::Group
        include Thor::Actions
        include Toppings::Helper::PathHelper
        include Toppings::Helper::BaseFileHelper
        include Toppings::Helper::IndexFileHelper

        argument :type
        argument :name

        def notify_invoke
          say "invoke Structure::#{self.class.stripped_class_name}"
        end

        def create_structure_file
          template rescued_sass_partial(type), structure_file_name(name)
        end

        def create_structure_index_file
          create_file index_file_path, skip: true
        end

        def append_structure_to_index
          append_import name, index_file_path
        end

        private

        def structure_file_name(name)
          base_path.join(sassy_file_name(name, partial: true))
        end

        def base_name
          type.pluralize
        end

        def rescued_sass_partial(type)
          File.exists?(self.class.source_root.join(erb_template(type))) ? erb_template(type) : default_template
        end

        def erb_template(type)
          sassy_file_name(type, type: :erb, partial: true)
        end

        def default_template
          sassy_file_name('default', type: :erb, partial: true)
        end

        class << self
          def source_root
            template_path.join('structures')
          end
        end
      end
    end
  end
end
