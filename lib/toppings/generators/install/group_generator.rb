require_relative 'root_file_generator'

module Toppings
  module Generators
    module Install

      # the GroupGenerator class provides some default behavior for a given
      # generator, that extends the GroupGenerator.
      #
      # For each groupfile a new group folder is created and a relative base file
      # is added to it, where included templates will be registered with appropriate
      # import statements.
      #
      # Template pathes and target pathes become available by convention over the
      # given specific classes base name, where the base name is build upon the classes name
      # with stripped Generator suffix.
      class GroupGenerator < BaseGenerator
        include Toppings::Helper::BaseFileHelper

        class_attribute :templates

        class << self
          # provides a path build upon the base name of a class as
          # source root for the thor template engine.
          #
          # @return [String] path to the class namespaced template folder
          def source_root
            template_path.join(base_name)
          end

          # dsl method to register certain template files, that should be
          # made available for the specific generator.
          #
          # @param files [*String] one or more template names
          # @return [Array] returns the list of registered templates
          def with_templates(*files)
            options = files.last.kind_of?(Hash) ? files.pop : {}
            Toppings::SASS_DEPENDENCIES.merge(options[:dependencies]) if options[:dependencies]

            files.each { |file| templates << file }
          end

          # registered templates for a group, that will be made available in the setup
          #
          # @return [Set] of registered templates
          def templates
            @templates ||= Set.new
          end
        end

        # creating the relative base file for a generator group and appending it
        # to the root file located in the stylesheet root.
        def create_base_import_file
          create_file base_file_path
          append_import group_base_name, root_file_path
        end

        # building templated files based on the beforehand registered template files
        def create_template_files
          self.templates.each { |file| group_template_file(file) } if self.templates?
        end

        private

        # copies a template file for the given generator group to the relative base file base.
        #
        # @param file [String] template file name
        def group_template_file(file)
          create_sass_file(file)
          append_import file, base_file_path
        end

        def create_sass_file(file, options = {})
          Toppings::Generators::SassFileGenerator.new([file], source_root: self.class.source_root, target_path: base_path).invoke_all
        end

      end
    end
  end
end
