require 'thor/group'

module Toppings
  module Generators
    module Setup
      class BaseGenerator < Thor::Group
        include Thor::Actions
        include Toppings::Helper::PathHelper

        def notify_invoke
          notify "invoke #{stripped_class_name}"
        end

        private

        def class_name
          self.class.name
        end

        def stripped_class_name
          class_name.split('::').last
        end

        def base_name
          stripped_class_name.gsub(/Generator$/, '').underscore
        end
      end
    end
  end
end
