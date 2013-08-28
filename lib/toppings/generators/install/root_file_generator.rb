# encoding: utf-8
module Toppings
  module Generators
    module Install
      class RootFileGenerator < BaseGenerator
        include Toppings::Helper::SassFrameworkHelper

        # the only ever fully compiled file at the moment
        def create_root_file
          create_file(root_file_path, skip: true) do
            [vendor_framework_imports, blank_line, start_application_framework].flatten.join
          end
        end

        private

        def vendor_framework_imports
          imports = sass_framework_imports.map { |import| import_format(import) }
          imports.unshift root_file_headline('Vendor Frameworks')
        end

        def start_application_framework
          root_file_headline 'Application Framework'
        end

        def root_file_comment(message)
          add_line_comment message, root_file_path
        end

        def root_file_headline(message)
          headline_comment message, root_file_path
        end
      end
    end
  end
end
