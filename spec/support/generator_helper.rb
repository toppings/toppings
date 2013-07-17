def create_stylesheets_folder(dir)
  FileUtils.mkdir_p Pathname(dir).join(stylesheets_path)
end

def create_dummy_root_file(dir)
  FileUtils.touch Pathname(dir).join(stylesheets_path).join("toppings.sass")
end