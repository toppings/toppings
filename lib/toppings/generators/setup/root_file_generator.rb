require 'thor/group'

module Toppings
  module Generators
    module Setup
      class RootFileGenerator < BaseGenerator

        # the only ever fully compiled file at the moment
        def create_root_file
          create_file base_path.join("toppings.css.sass")
        end

      end
    end
  end
end
