require 'thor/group'

module Toppings
  module Generators
    module Setup
      class SetupsGenerator < BaseGenerator

        def create_setting_files
          create_file base_path.join("_responsive_grid.css.sass")
          create_file base_path.join("_vertical_grid.css.sass")
        end

      end
    end
  end
end
