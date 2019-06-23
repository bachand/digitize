class Shell

  # Runs a shell command and returns the output.
  def self.output(command)
    `#{command}`
  end

  # Runs a shell command. Returns true if the command exits successfully; returns false otherwise.
  def self.run(command)
    Kernel.system(command)
  end
end
