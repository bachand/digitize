require_relative 'common.rb'

HANDBRAKE_PREFIX = `brew --prefix handbrake`.strip
HANDBRAKE_PATH = File.join(HANDBRAKE_PREFIX, 'bin/HandbrakeCLI')

# Wrapper around Handbrake CLI
class HandBrake

  ##
  # Returns the number of chapters in a video.
  def num_chapters(path)
    escaped_path = Shellwords.escape(path)
    command = "#{HANDBRAKE_PATH} --scan -i #{escaped_path}"
    shell_run(command)
  end

  ##
  # Encodes a source video with a specified preset.
  def encode(source_path, output_path, preset_path, preset_name)
    escaped_source_path = Shellwords.escape(source_path)
    escaped_output_path = Shellwords.escape(output_path)
    escaped_preset_path = Shellwords.escape(preset_path)

    # --main-feature tells Handbrake to find the title that is the main feature and encode that.
    command = %{
#{HANDBRAKE_PATH} \
  --preset-import-file #{escaped_preset_path} \
  --main-feature \
  -Z "#{preset_name}" \
  -i #{escaped_source_path} \
  -o #{escaped_output_path} \
    }
    shell_run(command)
  end
end
