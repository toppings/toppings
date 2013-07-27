# encoding: utf-8
module Toppings
  module Helper
    module SassContentHelper
      extend ActiveSupport::Concern

      private

      def add_line_comment(message, file)
        append_to_file file, "// #{message}"
      end

      def add_headline_comment(message, file)
        append_to_file file, <<-EOM
#{devider(file)}
// #{message}
        #{devider(file)}
        EOM
      end

      def devider(file)
        '// ---------------------------------------------------------------------------'
      end

      def add_blank_line(file)
        append_to_file file, "\n", force: true
      end

      def append_import(import_file, target_file, options = {})
        append_to_file target_file, import_format(import_file)
      end

      def import_format(import_file)
        "@import \"#{import_file}\" \n"
      end
    end
  end
end