require 'thor/group'
require 'toppings/generators/setup'

module Toppings
  module Generators
    class InstallGenerator < Thor::Group
      include Thor::Actions
      include Toppings::Helper::GeneratorRegistrationHelper

      def install_framework_structure
        register_generator :root_file, :fonts, :settings, :setups, :helper, group: 'setup'
      end
    end
  end
end
