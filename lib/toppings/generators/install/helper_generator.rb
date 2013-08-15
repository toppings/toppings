# encoding: utf-8
module Toppings
  module Generators
    module Install
      class HelperGenerator < Toppings::Support::Generators::GroupGenerator
        with_templates :debug
      end
    end
  end
end
