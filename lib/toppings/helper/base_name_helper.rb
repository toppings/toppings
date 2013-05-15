module Toppings
  module Helper
    module BaseNameHelper

      private

      def base_path
        @base_path ||= stylesheets_path.join(base_name)
      end

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