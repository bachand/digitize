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

# Invokes `error` and exits with status code 1.
def error_and_exit(message)
  error(message)
  exit(1)
end

# Runs a shell command.
def shell_run(command)
  Kernel.system(command)
end
