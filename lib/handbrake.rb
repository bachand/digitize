require_relative 'common.rb'

HANDBRAKE_PREFIX = `brew --prefix handbrake`.strip
HANDBRAKE_PATH = File.join(HANDBRAKE_PREFIX, 'bin/HandbrakeCLI')

# Wrapper around Handbrake CLI
class HandBrake

  def encode(source_path, output_path, preset_path, preset_name)
    escaped_source_path = Shellwords.escape(source_path)
    escaped_output_path = Shellwords.escape(output_path)
    escaped_preset_path = Shellwords.escape(preset_path)

    command = %{
#{HANDBRAKE_PATH} \
  --preset-import-file #{escaped_preset_path} \
  -Z "#{preset_name}" \
  -i #{escaped_source_path} \
  -o #{escaped_output_path} \
    }
    run(command)
  end
end
