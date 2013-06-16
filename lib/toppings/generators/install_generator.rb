require 'thor/group'

module Toppings
  module Generators
    class InstallGenerator < Thor::Group
      include Thor::Actions
      include Toppings::Helper::GeneratorRegistrationHelper

      def notify_invoke
        say "invoke InstallGenerator"
      end

      def install_framework_structure
        register_generator :root_file, :fonts, :settings, :setups, :helper, group: 'install'
      end
    end
  end
end
