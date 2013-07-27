# encoding: utf-8
module Toppings
  module Generators
    module Install
      class RootFileGenerator < BaseGenerator
        include Toppings::Helper::SassFrameworkHelper

        # the only ever fully compiled file at the moment
        def create_root_file
          create_file root_file_path
        end

        def enable_sass_framework
          root_file_headline 'Vendor Frameworks'

          sass_framework_imports.each do |import|
            append_import(import, root_file_path)
          end

          add_blank_line root_file_path
        end

        def start_application_framework
          root_file_headline 'Application Framework'
        end

        private

        def root_file_comment(message)
          add_line_comment message, root_file_path
        end

        def root_file_headline(message)
          add_headline_comment message, root_file_path
        end
      end
    end
  end
end
