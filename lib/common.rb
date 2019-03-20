require_relative 'colors'

# Prints a message to `STDOUT`.
def info(message)
  $stdout.puts message
end

# Prints a yellow warning message to `STDERR`.
def warning(message)
  $stderr.puts message.yellow
end

# Prints a red error message to `STDERR`.
def error(message)
  $stderr.puts message.red
end

# Runs a shell command.
def run(command)
  system(command)
end
