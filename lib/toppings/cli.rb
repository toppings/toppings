require 'thor'

require 'toppings'
require "toppings/generators"

module Toppings
  class CLI < Thor

    desc "install", "create a basic topping styles layout"
    def install
      Toppings::Generators::InstallGenerator.start
    end

    desc "generate GENERATOR", "generating a toppings component like modules, settings etc."
    def generate(generator = nil, *args)
      case generator
        when 'module'
          Toppings::Generators::ModulesGenerator.start(args)
        else
          say "ERROR: generate was called with no generator argument"
          say "USAGE: valid generators are font | module | setting | setup"
      end
    end

    desc "g GENERATOR", "shortcut for generate"
    def g(generator = nil, *args)
      generate(generator, *args)
    end

  end
end