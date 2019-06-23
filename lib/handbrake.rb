require_relative 'shell.rb'

HANDBRAKE_PREFIX = `brew --prefix handbrake`.strip
HANDBRAKE_PATH = File.join(HANDBRAKE_PREFIX, 'bin/HandbrakeCLI')

# Wrapper around Handbrake CLI
class HandBrake

  ##
  # Returns the number of chapters in a video.
  def num_chapters(path)
    escaped_path = Shellwords.escape(path)
    arguments = "--scan -i #{escaped_path}"
    command = shell_command(arguments)
    Shell.output(command).match(/DVD has ([0-9]+) title/).captures.first.to_i
  end

  ##
  # Encodes a source video with a specified preset.
  def encode(source_path, output_path, preset_path, preset_name)
    escaped_source_path = Shellwords.escape(source_path)
    escaped_output_path = Shellwords.escape(output_path)
    escaped_preset_path = Shellwords.escape(preset_path)

    # --main-feature tells Handbrake to find the title that is the main feature and encode that.
    arguments = <<~EOT
    --preset-import-file #{escaped_preset_path} \
    --main-feature \
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
end
