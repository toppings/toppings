# encoding: utf-8
module Toppings
  module Helper
    module SassFrameworkHelper
      extend ActiveSupport::Concern

      included do
        include Toppings::Helper::SassContentHelper
      end

      private

      def sass_framework_imports
        [core_framework, css3_framework, reset_framework]
      end

      def core_framework
        Toppings.conf.sass.framework.core
      end

      def css3_framework
        Toppings.conf.sass.framework.css3
      end

      def reset_framework
        Toppings.conf.sass.framework.reset
      end
    end
  end
end