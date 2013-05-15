require 'thor/group'

module Toppings
  module Generators
    module Setup
      class BaseGenerator < Thor::Group
        include Thor::Actions
        include Toppings::Helper::PathHelper
      end
    end
  end
end
