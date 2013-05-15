require 'thor/group'

module Toppings
  module Generators
    module Setup
      class FontsGenerator < BaseGenerator

        def create_base_folder
          empty_directory base_path
        end

      end
    end
  end
end
