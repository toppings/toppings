# encoding: utf-8
module Toppings::Helper::SassFileHelper
  def sassy_file_name(file, options = {})
    sass_file = []

    sass_file.tap do |f|
      f << (options[:standalone] ? file : "_#{file}")
      f << (options[:dialect] || Toppings.conf.sass.dialect)
      f << 'erb' if options[:type] == :erb
    end

    sass_file.join('.')
  end
end