require 'ostruct'

module Toppings
  class Config < OpenStruct

    def initialize(options = {})
      super()

      options.each do |option, value|
        self.send "#{option}=", value.kind_of?(Hash) ? Toppings::Config.new(value) : value
      end
    end

    class << self
      def load
        @config ||= from_default_config
      end

      def from_custom_config
        @customs ||= new(parsed_config(custom_config_path))
      end

      def from_default_config
        @defaults ||= new(parsed_config(default_config_path))
      end

      def parsed_config(path)
        config_file = File.read(path)
        JSON.parse(config_file)
      end

      def default_config_path
        config_path.join default_config_name
      end

      def custom_config_path
        config_path.join default_config_name
      end

      def default_config_name
        'default.json'
      end

      def config_path
        Pathname.new(Toppings.gem_root).join('config')
      end
    end
  end
end
