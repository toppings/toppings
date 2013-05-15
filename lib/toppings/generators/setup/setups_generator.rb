module Toppings
  module Generators
    module Setup
      class SetupsGenerator < GroupGenerator

        SETUP_FILES = %w{responsive_grid vertical_grid}
        def create_setup_files
          SETUP_FILES.each { |file| create_group_file file }
        end

      end
    end
  end
end
