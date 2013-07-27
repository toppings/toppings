# encoding: utf-8
require 'active_support/core_ext/hash/deep_merge'
require 'ostruct'

module Toppings
  class Config < OpenStruct

    def initialize(options = {})
      super()

      options.each do |option, value|
        send "#{option}=", value.kind_of?(Hash) ? Toppings::Config.new(value) : value
      end
    end

    class << self
      def load
        @config = new(joined_config)
      end

      def joined_config
        default_config.deep_merge(custom_config)
      end

      def custom_config
        @customs = parsed_config(custom_config_path)
      end

      def default_config
        @defaults = parsed_config(default_config_path)
      end

      def parsed_config(path)
        config_file = File.read(path) if File.exists?(path)
        JSON.parse(config_file || '{}')
      end

      def default_config_path
        gem_config_path.join default_config_name
      end

      def custom_config_path
        app_config_path.join custom_config_name
      end

      def default_config_name
        'default.json'
      end

      def custom_config_name
        'toppings.json'
      end

      def gem_config_path
        Pathname.new(Toppings.gem_root).join('config')
      end

      # The app config path is based on the current directory,
      # from where the toppings command is called.
      #
      # TODO: app_config path should be configurable by a thor param
      def app_config_path
        Pathname.new('.').join('config')
      end
    end
  end
end
