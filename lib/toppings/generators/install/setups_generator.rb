module Toppings
  module Generators
    module Install
      class SetupsGenerator < GroupGenerator
        with_templates :responsive_grid, :vertical_rhythm, :modular_scale
      end
    end
  end
end
