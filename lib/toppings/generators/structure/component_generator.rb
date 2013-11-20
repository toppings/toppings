# encoding: utf-8

module Toppings
  module Generators
    module Structure
      class ComponentGenerator < Toppings::Generators::Structure::BaseGenerator

        def create_component_structure
          component_template(type, name, "m-#{name}", template: 'module')
          component_template(type, name, "l-#{name}", template: 'layout')
        end

        private

        def component_template(type, component_name, target_name, options = {})
          template rescued_sass_partial(options[:template]), component_path(component_name).join(sassy_file_name(target_name, partial: true))
          append_import "#{component_name}/#{target_name}", structure_file_name(component_name)
        end

        def component_path(name)
          base_path.join(name)
        end

        class << self
          def source_root
            template_path.join('structures', 'component')
          end
        end
      end
    end
  end
end
