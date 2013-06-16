require 'thor/group'

module Toppings
  module Generators
    module Install
      class BaseGenerator < Thor::Group
        include Thor::Actions
        include Toppings::Helper::PathHelper

        def notify_invoke
          say "invoke Install::#{self.class.stripped_class_name}"
        end

        def self.source_root
          template_path
        end

        def base_name
          self.class.base_name
        end

        class << self
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
end
