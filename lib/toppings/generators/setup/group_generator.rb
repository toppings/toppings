require_relative 'root_file_generator'

module Toppings
  module Generators
    module Setup
      class GroupGenerator < BaseGenerator

        class_attribute :stylesheet_group

        def create_base_import_file
          create_file base_file
          append_import base_file, root_file_path
        end

        private

        def base_file
          base_path.join("_base.css.sass")
        end

        def append_import(import_file, target_file)
          append_to_file target_file, "@import \"./#{import_file}\" \n"
        end

        def base_path
          @base_path ||= stylesheets_path.join(base_name)
        end

        def class_name
          self.class.name
        end

        def stripped_class_name
          class_name.split('::').last
        end

        def base_name
          stripped_class_name.gsub(/Generator$/, '').underscore
        end

        #def stylesheet_group?
        #  !!self.class.stylesheet_group
        #end

        class << self
          def as_stylesheet_group
            self.stylesheet_group = true
          end
        end

      end
    end
  end
end
