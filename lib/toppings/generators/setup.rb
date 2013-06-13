require 'toppings/generators/setup/base_generator'
require 'toppings/generators/setup/group_generator'

# require other setup generator files
Dir.glob(File.join(Toppings.gem_root, "**", "setup", "*_generator.rb")).each do |generator|
  require generator
end
