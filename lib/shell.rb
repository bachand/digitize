class Shell

  def self.output(command)
    `#{command}`
  end
end
