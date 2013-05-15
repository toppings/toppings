module Toppings
  module Generators
    module Setup
      class SupportGenerator < GroupGenerator

        def create_setting_files
          create_file base_path.join("_debug.css.sass")
        end

      end
    end
  end
end
