require 'active_support/all'

module Toppings
  def self.gem_root
    @gem_root ||= File.expand_path("../..", __FILE__)
  end

  def self.conf
    @conf ||= Toppings::Config.new
  end
end


require "toppings/helper"
require "toppings/config"
require "toppings/version"

require 'pathname'


