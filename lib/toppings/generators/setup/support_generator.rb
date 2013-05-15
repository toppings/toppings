module Toppings
  module Generators
    module Setup
      class SupportGenerator < GroupGenerator


        SUPPORT_FILES = %w{debug}
        def create_support_files
          SUPPORT_FILES.each { |file| create_group_file file }
        end

      end
    end
  end
end
