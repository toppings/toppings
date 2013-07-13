module Toppings::Helper

end

# require other setup generator files
Dir.glob(File.join(Toppings.gem_root, "**", "helper", "*_helper.rb")).each do |helper|
  require helper
end


