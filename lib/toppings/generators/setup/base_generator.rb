require 'thor/group'

module Toppings
  module Generators
    module Setup
      class BaseGenerator < Thor::Group
        include Thor::Actions
        include Toppings::Helper::PathHelper
        include Toppings::Helper::BaseNameHelper
      end
    end
  end
end
