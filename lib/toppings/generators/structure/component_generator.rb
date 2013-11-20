# encoding: utf-8

module Toppings
  module Generators
    module Structure
      class ComponentGenerator < Toppings::Generators::Structure::BaseGenerator

        def create_component_structure
          component_template(type, name, "m-#{name}")
          component_template(type, name, "l-#{name}")
        end

        private

        def component_template(type, component_name, target_name)
          template rescued_sass_partial(type), component_path(component_name).join(sassy_file_name(target_name, partial: true))
          append_import "#{component_name}/#{target_name}", structure_file_name(component_name)
        end


        def component_path(name)
          base_path.join(name)
        end

      end
    end
  end
end
