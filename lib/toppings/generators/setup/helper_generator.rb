module Toppings
  module Generators
    module Setup
      class HelperGenerator < GroupGenerator

        HELPER_FILES = %w{debug}
        def create_support_files
          HELPER_FILES.each { |file| group_template_file file }
        end

      end
    end
  end
end
