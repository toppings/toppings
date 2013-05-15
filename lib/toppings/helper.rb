# require other setup generator files
Dir.glob(File.join("**", "helper", "*_helper.rb")).each do |helper|
  require helper.gsub('lib/', '')
end
