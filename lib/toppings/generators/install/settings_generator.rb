module Toppings
  module Generators
    module Install
      class SettingsGenerator < GroupGenerator
        with_templates :colors, :shadows, :borders, :typography, :dimensions
      end
    end
  end
end
