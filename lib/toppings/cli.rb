require 'thor'

require 'toppings'
require "toppings/generators"

module Toppings
  class CLI < Thor
    desc "install", "create a basic topping styles layout"
    def install
      Toppings::Generators::InstallGenerator.start
    end

    desc "component", "create a new sass component"
    def component

    end

    desc "c", "shortcut for component"
    def c
      component
    end
  end
end