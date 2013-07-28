# encoding: utf-8
module Toppings
  module Helper
    module GeneratorRegistrationHelper
      extend ActiveSupport::Concern

      included do
        class_attribute :_generators
      end

      def registered_generators
        self.class.generators
      end

      private :registered_generators

      module ClassMethods

        def generators
          self._generators ||= []
        end

        def register(*new_generators)
          generators.concat new_generators
        end

      end

    end
  end
end