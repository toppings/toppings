require 'thor/group'
require 'toppings/generators/setup'

module Toppings
  module Generators
    class InstallGenerator < Thor::Group
      include Thor::Actions

      def install_framework_structure
        %w{root_file fonts settings setups support}.each do |generator|
          # TODO clean up this static call structure
          "Toppings::Generators::Setup::#{generator.camelcase}Generator".constantize.start
        end
      end
    end
  end
end
