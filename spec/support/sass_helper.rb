require 'sass'

def sass_check(content)
  r = begin
    ::Sass::Engine.new(content, check_syntax: true).render
  rescue ::Sass::SyntaxError => e
    raise e
  end

  !r.nil?
end
