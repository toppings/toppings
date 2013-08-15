# encoding: utf-8
module Toppings
  module Generators
    module Install
      class SettingsGenerator < Toppings::Support::Generators::GroupGenerator
        with_templates :colors, :shadows, :borders, :typography, :dimensions
      end
    end
  end
end
