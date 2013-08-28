# encoding: utf-8
require_relative 'group_generator'

module Toppings
  module Generators
    module Install
      class SetupsGenerator < GroupGenerator
        with_templates :vertical_rhythm
      end
    end
  end
end
