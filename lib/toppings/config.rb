module Toppings
  class Config < OpenStruct

    def initialize(options = {})
      super()

      options.each do |option, value|
        self.send "#{option}=", value.kind_of?(Hash) ? Toppings::Config.new(value) : value
      end
    end

  end
end
