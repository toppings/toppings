# encoding: utf-8
require 'toppings'

module Toppings
  class CLI < Thor
    VALID_GENERATORS = %w{component setting font setup layout helper}.freeze


    desc 'install', 'create a basic topping styles layout'
    def install
      Toppings::Generators::InstallGenerator.start
    end

    desc 'generate GENERATOR', 'generating a toppings component like modules, settings etc.'

    def generate(generator = nil, *args)
      if generator
        if VALID_GENERATORS.include? generator
          Toppings::Generators::StructuresGenerator.start(args.unshift(generator))
        else
          args_error_message('invalid generator argument')
        end
      else
        args_error_message('no generator argument')
      end
    end

    desc 'g GENERATOR', 'shortcut for generate'
    def g(generator = nil, *args)
      generate(generator, *args)
    end

    private

    def args_error_message(error_type)
      say "ERROR: generate was called with #{error_type}"
      say "USAGE: valid generators are #{VALID_GENERATORS.join(' ')}"
    end

  end
end
