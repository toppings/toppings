module Toppings
  module Helper
    module PathHelper
      extend ActiveSupport::Concern

      def stylesheets_path
        @stylesheets_path ||= root_path.join('stylesheets')
      end

      def root_path
        self.class.root_path
      end

      # TODO: base file name has to be configurable
      def root_file_path
        stylesheets_path.join("#{Toppings.conf.stylesheets.root_file}.css.#{Toppings.conf.sass.dialect}")
      end

      module ClassMethods
        def template_path
          @template_path ||= root_path.join('lib', 'toppings', 'templates')
        end

        def root_path
          Pathname.new('.')
        end
      end

    end
  end
end