module Toppings
  module Helper
    module PathHelper
      extend ActiveSupport::Concern

      def stylesheets_path
        @stylesheets_path ||= Pathname('.').join('stylesheets')
      end

      # TODO: base file name has to be configurable
      def root_file_path
        stylesheets_path.join("#{Toppings.conf.stylesheets.root_file}.css.#{Toppings.conf.sass.dialect}")
      end

      module ClassMethods
        def template_path
          @template_path ||= Pathname(Toppings.gem_root).join('lib', 'toppings', 'templates')
        end
      end

    end
  end
end