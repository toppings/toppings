module Toppings
  module Helper
    module IndexFileHelper
      extend ActiveSupport::Concern

      included do
        include Toppings::Helper::BaseFileHelper
      end

      private

      def index_base_name
        relative_base_path.join(Toppings.conf.stylesheets.relative_base_file)
      end

      def index_file_name
        sassy_file_name Toppings.conf.stylesheets.relative_index_file
      end

    end
  end
end