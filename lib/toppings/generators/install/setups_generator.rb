module Toppings
  module Generators
    module Install
      class SetupsGenerator < GroupGenerator
        with_templates :vertical_rhythm, :modular_scale
        with_templates :responsive_grid, dependencies: [:susy]
      end
    end
  end
end
