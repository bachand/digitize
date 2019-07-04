require 'tty-prompt'

require_relative 'common.rb'
require_relative 'shell.rb'

HANDBRAKE_PREFIX = `brew --prefix handbrake`.strip
HANDBRAKE_PATH = File.join(HANDBRAKE_PREFIX, 'bin/HandbrakeCLI')

# Wrapper around Handbrake CLI
class HandBrake

  def initialize
    @prompt = TTY::Prompt.new
  end

  ##
  # Returns the number of titles in a video.
  def num_titles(path)
    escaped_path = Shellwords.escape(path)
    arguments = "--scan -i #{escaped_path}"
    command = shell_command(arguments)
    Shell.output(command).match(/DVD has ([0-9]+) title/).captures.first.to_i
  end

  ##
  # Encodes a source video with a specified preset. Asks the user which title they would like to
  # encode if the provided DVD has more than one title.
  def encode(source_path, output_path, preset_path, preset_name)
    # Default to the first title, since all DVDs should have at least one title.
    title_to_encode = 0

    num_titles = num_titles(source_path)
    unless num_titles == 1
      choices = title_choices(num_titles)
      question = "This DVD has #{num_titles} titles. Which one would you like to process?"
      title_to_encode = @prompt.select(question, choices)
    end

    escaped_source_path = Shellwords.escape(source_path)
    escaped_output_path = Shellwords.escape(output_path)
    escaped_preset_path = Shellwords.escape(preset_path)

    arguments = <<~EOT
    --title #{title_to_encode} \
    --preset-import-file #{escaped_preset_path} \
    -Z "#{preset_name}" \
    -i #{escaped_source_path} \
    -o #{escaped_output_path}
    EOT
    command = shell_command(arguments)
    Shell.run(command)
  end

  private

  ##
  # Creates a full command that can be run in the shell. Ensures that Handbrake prints to STDOUT. By
  # default it seems to print to STDERR.
  def shell_command(arguments)
    "#{HANDBRAKE_PATH} #{arguments.strip} 2>&1"
  end

  ##
  # Creates a hash of titles choices to be passed to `TTY::Prompt`'s `select` method.
  def title_choices(num_titles)
    choices = {}
    num_titles.times do |index|
      title = index + 1
      choices.merge!({ "Title #{title}" => title })
    end
    return choices
  end
end
