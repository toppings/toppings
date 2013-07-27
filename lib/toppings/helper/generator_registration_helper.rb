# encoding: utf-8
module Toppings
  module Helper
    module GeneratorRegistrationHelper
      extend ActiveSupport::Concern

      def register_generator(*generators)
        options = generators.last.is_a?(Hash) ? generators.pop : {}

        raise 'missing option :group for generator registration' unless options[:group]
        group = options[:group]

        generators.each do |generator|
          group_generator(group, generator).start
        end
      end

      private

      def group_generator(group, generator)
        generator = generator.to_s.camelcase

        [generators_module_space,
         group.camelcase,
         "#{generator}Generator"].join('::').constantize
      rescue
        say "Generator #{generator} could not be found", :red
      end

      def generators_module_space
        'Toppings::Generators'
      end

    end
  end
end