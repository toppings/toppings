module Toppings
  class Config < OpenStruct

    def initialize(options = {})
      super()

      options.each do |option, value|
        self.send "#{option}=", value.kind_of?(Hash) ? Toppings::Config.new(value) : value
      end
    end

    class << self
      def from_defaults
        @defaults ||= new(parsed_default_config)
      end

      def parsed_default_config
        config_file = File.read(default_config_path)
        JSON.parse(config_file)
      end

      def default_config_path
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
