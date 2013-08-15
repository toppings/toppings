# encoding: utf-8
require 'toppings'

module Toppings
  class CLI < Thor
    VALID_GENERATORS = %w{module setting font setup layout helper}.freeze


    desc 'install', 'create a basic topping styles layout'

    def install
      Toppings::Generators::InstallGenerator.start
    end

    desc 'generate GENERATOR', 'generating a toppings component like modules, settings etc.'

    def generate(generator = nil, *args)
      if generator
        if VALID_GENERATORS.include? generator
          Toppings::Generators::ComponentsGenerator.start(args.unshift(generator))
        else
          args_error_message('invalid')
        end
      else
        args_error_message('no')
      end
    end

    desc 'g GENERATOR', 'shortcut for generate'

    def g(generator = nil, *args)
      generate(generator, *args)
    end

    private

    def args_error_message(error_type)
      say "ERROR: generate was called with #{error_type} generator argument"
      say 'USAGE: valid generators are font | module | setting | setup'
    end

  end
end