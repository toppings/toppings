require 'tempfile'
require 'sass'
require 'sass/exec'
require 'sass/util'
require 'compass'
require 'digest'

module Toppings::Helper::SassConversionHelper
  extend ActiveSupport::Concern

  included do
    attr_accessor :source_file, :target_file
  end

  def convert_to_scss(content)
    init_tempfiles_for_conversion(content)

    # convert source content to the target format, placed in the target file
    # TODO: make conversion more dynamic, by allowing conversion from scss to sass too.
    ::Sass::Util.silence_sass_warnings do
      Sass::Exec::SassConvert.new(["-F", "sass", "-T", "scss", source_file, target_file]).parse
    end

    converted_content
  ensure
    [source_file, target_file].each(&:close)
    [source_file, target_file].each(&:unlink)
  end

  def valid_sass?(content)
    load_dependencies

    ::Sass::Util.silence_sass_warnings do
      begin
        Sass::Engine.new(content, sass_engine_options.merge(check_syntax: true)).render
      rescue ::Sass::SyntaxError => e
        say e.message
        false
      end
    end
  end

  def load_dependencies
    Toppings::SASS_DEPENDENCIES.each { |dep| require dep.to_s }
    load_compass_paths
  end

  def load_compass_paths
    load_paths.merge Compass.configuration.sass_load_paths
  end

  def load_paths
    sass_engine_options[:load_paths] ||= Set.new
  end

  def sass_engine_options
    @sass_engine_options ||= {}
  end

  private

  def init_tempfiles_for_conversion(content)
    file_name    = Digest::MD5.new.update(content)
    @source_file = Tempfile.new("#{file_name}_source")
    @target_file = Tempfile.new("#{file_name}_target")

    write_source(content)
  end

  def write_source(content)
    source_file.write(content)
    source_file.rewind
  end

  def converted_content
    target_file.rewind
    target_file.read
  end
end