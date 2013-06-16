module Toppings
  module Generators
    module Install
      class RootFileGenerator < BaseGenerator

        # the only ever fully compiled file at the moment
        def create_root_file
          create_file root_file_path
        end

      end
    end
  end
end
