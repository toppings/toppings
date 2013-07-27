# encoding: utf-8
module Toppings
  module Helper
    module IndexFileHelper
      extend ActiveSupport::Concern

      included do
        include Toppings::Helper::BaseFileHelper
      end

      private

      def index_file_path
        base_path.join(index_file_name)
      end

      def relative_index_name
        relative_base_path.join(Toppings.conf.stylesheets.relative_index_file)
      end

      def index_file_name
        sassy_file_name Toppings.conf.stylesheets.relative_index_file
      end

    end
  end
end