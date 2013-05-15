require 'thor/group'

module Toppings
  module Generators
    module Setup
      class SettingsGenerator < BaseGenerator

        SETTINGS_FILES = %w{typography colors shadows borders}

        def create_base_import_file
          create_file base_file
        end

        def create_setting_files
          # TODO: make file ending style configurable for scss
          SETTINGS_FILES.each do |file|
            create_file base_path.join("_#{file}.css.sass")
            append_import file
          end
        end


        private

        def base_file
          base_path.join("_base.css.sass")
        end

        def append_import(file_name)
          append_to_file base_file, "@import \"./#{file_name}\" \n"
        end

      end
    end
  end
end
