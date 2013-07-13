def generate_valid_sass_file(*args, &block)
  generate(*args) { |content|
    valid_sass?(content).should(be_true)
    content.should_not be_blank
    yield(content) if block_given?
  }
end
