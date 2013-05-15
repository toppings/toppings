require 'thor'
require 'toppings'
require "toppings/generators/install_generator"

module Toppings
  class CLI < Thor

    desc "install", "create a basic topping styles layout"
    def install
      Toppings::Generators::InstallGenerator.start
    end

    desc "component", "create a new sass component"
    def component

    end

  end
end