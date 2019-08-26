require 'open3'
require_relative 'common'

class Shell

  class ShellError < StandardError
    attr_reader :output
    attr_reader :wrappedError

    def initialize(output, wrappedError)
      @output = output
      @wrappedError = wrappedError
    end
  end

  # Runs a shell command and returns the output.
  def self.output(command)
    output, error = Open3.capture2(command)
    unless error.success?
      raise ShellError.new(output, error)
    end
    return output
  end

  # Runs a shell command. Returns true if the command exits successfully; returns false otherwise.
  def self.run(command)
    Kernel.system(command)
  end
end
