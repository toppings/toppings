module Toppings
  module Generators
    module Setup
      class SettingsGenerator < GroupGenerator

        SETTINGS_FILES = %w{typography colors shadows borders}

        def create_setting_files
          # TODO: make file ending style configurable for scss
          SETTINGS_FILES.each do |file|
            create_file base_path.join("_#{file}.css.sass")
            append_import file, base_file
          end
        end

      end
    end
  end
end
