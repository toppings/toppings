require_relative 'root_file_generator'

module Toppings
  module Generators
    module Setup
      class GroupGenerator < BaseGenerator
        class_attribute :templates

        class << self
          def source_root
            template_path.join(base_name)
          end

          def with_templates(*files)
            self.templates = files
          end
        end

        def create_base_import_file
          create_file base_file
          append_import group_base_name, root_file_path
        end

        def create_template_files
          self.templates.each { |file| group_template_file(file.to_s) } if self.templates?
        end

        private

        def group_template_file(file, append = true)
          template sass_partial_name(file), base_path.join(sass_partial_name(file))
          append_import file, base_file if append
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
