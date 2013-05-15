module Toppings
  module Helper
    module PathHelper

      def stylesheets_path
        @stylesheets_path ||= Pathname.new('.').join('stylesheets')
      end

      # TODO: base file name has to be configurable
      def root_file_path
        stylesheets_path.join("toppings.css.sass")
      end

    end
  end
end