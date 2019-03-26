require_relative 'common.rb'

HANDBRAKE_PREFIX = `brew --prefix handbrake`.strip
HANDBRAKE_PATH = File.join(HANDBRAKE_PREFIX, 'bin/HandbrakeCLI')

# Wrapper around Handbrake CLI
class HandBrake

  def encode(source_path, output_path)
    escaped_source_path = Shellwords.escape(source_path)
    escaped_output_path = Shellwords.escape(output_path)
    puts("Output: #{escaped_output_path}")

    run("#{HANDBRAKE_PATH} -i #{escaped_source_path}")
  end
end
