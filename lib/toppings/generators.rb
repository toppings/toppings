module Toppings::Generators

end

# manual require statements upfront to keep them in ordered before all others
require 'toppings/generators/sass_file_generator'
require 'toppings/generators/install/base_generator'
require 'toppings/generators/install/group_generator'
require 'toppings/generators/install_generator'
require 'toppings/generators/components_generator'