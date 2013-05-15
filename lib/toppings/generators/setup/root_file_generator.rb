require 'thor/group'

module Toppings
  module Generators
    module Setup
      class RootFileGenerator < BaseGenerator

        # the only ever fully compiled file at the moment
        def create_root_file
          # TODO: base file name has to be configurable
          create_file stylesheets_path.join("toppings.css.sass")
        end

      end
    end
  end
end
