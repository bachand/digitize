require_relative 'colors'

def info(message)
  $stdout.puts message
end

def warning(message)
  $stderr.puts message.yellow
end

def error(message)
  $stderr.puts message.red
end
