require_relative 'root_file_generator'

module Toppings
  module Generators
    module Setup
      class GroupGenerator < BaseGenerator

        def create_base_import_file
          create_file base_file
          append_import group_base_name, root_file_path
        end

        class << self
          def source_root
            template_path.join(base_name)
          end
        end

        private

        def group_template_file(file)
          template sass_partial_name(file), base_path.join(sass_partial_name(file))
          #append_import file, base_file
        end

        def sass_partial_name(file)
          "_#{file}.css.sass"
        end

        def create_group_file(file)
          # TODO: make file ending style configurable for scss
          create_file base_path.join("_#{file}.css.sass")
          append_import file, base_file
        end

        def group_base_name
          base_path.join("base")
        end

        def base_file
          base_path.join("_base.css.sass")
        end

        def append_import(import_file, target_file)
          append_to_file target_file, "@import \"#{import_file}\" \n"
        end

        def base_path
          @base_path ||= stylesheets_path.join(base_name)
        end
      end
    end
  end
end
