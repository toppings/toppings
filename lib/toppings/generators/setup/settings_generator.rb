module Toppings
  module Generators
    module Setup
      class SettingsGenerator < GroupGenerator
        with_templates :colors, :shadows, :borders, :typography
      end
    end
  end
end
