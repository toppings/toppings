module Toppings
  module Helper
    module PathHelper

      def stylesheets_path
        @stylesheets_path ||= Pathname.new('.').join('stylesheets') #Rails.root.join("app/assets/stylesheets")
      end

    end
  end
end