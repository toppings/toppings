require 'term/ansicolor'

include Term::ANSIColor

private

def warning(message)
  puts yellow(bold(message))
end

def error(message)
  puts red(bold(message))
end

def notify(message)
  puts green(bold(message))
end
