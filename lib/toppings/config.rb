module Toppings
  class Config < OpenStruct

    def initialize(options = {})
      super()

      options.each do |option, value|
        self.send "#{option}=", value.kind_of?(Hash) ? Toppings::Config.new(value) : value
      end
    end

    def default_config
      @default_config ||= self.default_config = parse_default_config
    end

    def parse_default_config
      config_file = File.read(default_config_path)
      JSON.parse(config_file)
    end

    def default_config_path
      Pathname.new(Toppings.gem_root).join('config', default_config_name)
    end

    def default_config_name
      'default.json'
    end
  end
end
