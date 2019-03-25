HANDBRAKE_PREFIX = `brew --prefix handbrake`.strip
HANDBRAKE_PATH = File.join(HANDBRAKE_PREFIX, 'bin/HandbrakeCLI')

# Wrapper around Handbrake CLI
class HandBrake

  def encode(source_path, output_dirname)
    escaped_source_path = Shellwords.escape(source_path)
    escaped_output_dirname = Shellwords.escape(output_dirname)
    puts("Output: #{escaped_output_dirname}")

    run("#{HANDBRAKE_PATH} -i #{escaped_source_path}")
  end
end
