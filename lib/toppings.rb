require 'set'
require 'active_support/all'

module Toppings
  SASS_DEPENDENCIES ||= Set.new

  def self.gem_root
    @gem_root ||= File.expand_path("../..", __FILE__)
  end

  def self.conf
    @conf ||= Toppings::Config.load
  end
end


require "toppings/helper"
require "toppings/config"
require "toppings/version"

