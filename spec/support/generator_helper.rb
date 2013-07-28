# encoding: utf-8
def create_stylesheets_folder(dir)
  FileUtils.mkdir_p Pathname(dir).join(stylesheets_path)
end

def create_dummy_root_file(dir)
  FileUtils.touch Pathname(dir).join(stylesheets_path).join('toppings.sass')
end

def generate_index_file(installer)
  generate(stylesheets_path.join("#{installer}/_#{Toppings.conf.stylesheets.relative_index_file}.sass"))
end