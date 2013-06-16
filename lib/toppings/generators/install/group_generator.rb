require_relative 'root_file_generator'

module Toppings
  module Generators
    module Install
      class GroupGenerator < BaseGenerator
        include Toppings::Helper::BaseFileHelper

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
          create_file base_file_path
          append_import group_base_name, root_file_path
        end

        def create_template_files
          self.templates.each { |file| group_template_file(file.to_s) } if self.templates?
        end

        private

        def group_template_file(file, append = true)
          template sass_partial_name(file), base_path.join(sass_partial_name(file))
          append_import file, base_file_path if append
        end

        def create_group_file(file)
          # TODO: make file ending style configurable for scss
          create_file base_path.join("_#{file}.css.#{Toppings.conf.sass.dialect}")
          append_import file, base_file_path
        end

      end
    end
  end
end
