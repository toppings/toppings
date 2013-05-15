module Toppings
  module Generators
    module Setup
      class SettingsGenerator < GroupGenerator

        SETTINGS_FILES = %w{typography colors shadows borders}
        def create_setting_files
          SETTINGS_FILES.each { |file| create_group_file file }
        end

      end
    end
  end
end
