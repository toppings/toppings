module Toppings
  module Helper
    module BaseFileHelper
      extend ActiveSupport::Concern

      private

      def group_base_name
        relative_base_path.join("base")
      end

      def relative_base_file_path
        relative_base_path.join(base_file_name)
      end

      def base_file_path
        base_path.join(base_file_name)
      end

      def base_path
        @base_path ||= stylesheets_path.join(relative_base_path)
      end

      def base_file_name
        "_base.css.#{Toppings.conf.sass.dialect}"
      end

      def sass_partial_name(file, type = nil)
        file_name = %W{_#{file} css #{Toppings.conf.sass.dialect}}
        file_name << "erb" if type == :erb
        file_name.join('.')
      end

      def base_name
        self.class.base_name
      end

      def relative_base_path
        @relative_base_path ||= Pathname.new(base_name)
      end

      def append_import(import_file, target_file)
        append_to_file target_file, "@import \"#{import_file}\" \n"
      end

      module ClassMethods
        def base_name=(name)
          @base_name = name
        end

        def base_name
          @base_name ||= stripped_class_name.gsub(/Generator$/, '').underscore
        end

        def stripped_class_name
          name.demodulize
        end
      end
    end
  end
end