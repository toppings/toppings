# encoding: utf-8
def generate_valid_sass_file(*args, &block)
  generate(*args) { |content|
    sass_content_dir = File.dirname(File.expand_path(args[0]))

    valid_sass?(content, sass_content_dir).should(be_true)
    content.should_not be_blank
    yield(content) if block_given?
  }
end
