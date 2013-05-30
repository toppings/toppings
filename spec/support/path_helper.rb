def stylesheets_path
  @stylesheet_path ||= Pathname.new("stylesheets")
end

def root_file
  stylesheets_path.join('toppings.css.sass')
end