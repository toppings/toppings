# encoding: utf-8
module Toppings
  module Generators
    module Install
      class SetupsGenerator < GroupGenerator
        with_templates :vertical_rhythm, :modular_scale
        with_template :responsive_grid, vendor_library: :susy
      end
    end
  end
end
