# manual require statements upfront to keep them in ordered before all others
require 'toppings/generators/install_generator'
require 'toppings/generators/install/base_generator'
require 'toppings/generators/install/group_generator'

# require other setup generator files
Dir.glob(File.join(Toppings.gem_root, "**", "install", "*_generator.rb")).each do |generator|
  require generator
end
