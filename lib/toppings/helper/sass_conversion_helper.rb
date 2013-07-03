require 'tempfile'
require 'sass'
require 'sass/exec'
require 'digest'

module Toppings::Helper::SassConversionHelper

  def convert_to_scss(content)
    file_name = Digest::MD5.new.update(content)
    # checking sass before converting
    @source_file = Tempfile.new("#{file_name}_source")
    @target_file = Tempfile.new("#{file_name}_target")

    # prepare source
    @source_file.write(content)
    @source_file.rewind

    # convert source content to the target format, placed in the target file
    Sass::Exec::SassConvert.new(["-F", "sass", "-T", "scss", @source_file, @target_file]).parse

    # read result from target file
    @target_file.rewind
    @target_file.read
  ensure
    [@source_file, @target_file].each(&:close)
    [@source_file, @target_file].each(&:unlink)
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
    # TODO: make dependencies configurable
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