require 'sass'
require 'sass/exec'
require 'compass'
require 'bundler'


module Toppings::Helper::SassConversionHelper
  def convert_to_scss(file_name)
    # checking sass before converting
    src_file = File.open(file_name)
    tgt_file = File.open(file_name.to_s + '.scss', 'w')

    #Sass::Exec::SassConvert.new([]).parse!
    sass_convert = Sass::Exec::SassConvert.new(["-F", "sass", "-T", "scss", src_file, tgt_file])
    sass_convert.parse
  end

  def valid_sass?(content)
    load_dependencies

    r = begin
      Sass::Engine.new(content, sass_engine_options.merge(check_syntax: true)).render
    rescue ::Sass::SyntaxError => e
      puts "Sass::SyntaxError:: #{e.message}"
      raise e
    rescue => e
      puts "Unknown Exception:: #{e.message}"
      raise e
    end

    !r.nil?
  end

  def load_dependencies
    %w{susy}.each { |dep| require dep }
    update_load_pathes
  end

  def update_load_pathes
    sass_engine_options[:load_paths] ||= []
    sass_engine_options[:load_paths] += Compass.configuration.sass_load_paths
  end

  def sass_engine_options
    @sass_engine_options ||= {}
  end

end