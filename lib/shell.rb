require 'open3'

class Shell

  # Runs a shell command and returns the output.
  def self.output(command)
    output, error = Open3.capture2(command)
    unless error.success?
      raise StandardError.new 'Command failed'
    end
    return output
  end

  # Runs a shell command. Returns true if the command exits successfully; returns false otherwise.
  def self.run(command)
    Kernel.system(command)
  end
end
