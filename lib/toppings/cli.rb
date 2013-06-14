require 'thor'

require 'toppings'
require "toppings/generators"

module Toppings
  class CLI < Thor
    desc "install", "create a basic topping styles layout"
    def install
      Toppings::Generators::InstallGenerator.start
    end

    desc "module", "create a new sass module"
    def module(*args)
      Toppings::Generators::ModuleGenerator.start(args)
    end

    desc "m", "shortcut for component"
    def m(*args)
      self.module(*args)
    end
  end
end