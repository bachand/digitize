require 'shellwords'

require_relative 'lib/common.rb'

# These commands require you first to run `brew bundle` in this repo.

HANDBRAKE_PREFIX = `brew --prefix handbrake`.strip
HANDBRAKE_PATH = File.join(HANDBRAKE_PREFIX, 'bin/HandbrakeCLI')

desc 'Transcode a video from one format to the another'
task :transcode, [:source_path] do |task, args|
   source_path = args[:source_path]
   error_and_exit('Missing source path.') unless source_path
   error_and_exit("#{source_path} does not exist.") unless File.exist?(source_path)
   error_and_exit('Source must be a file.') unless Pathname.new(source_path).file?
   escaped_source_path = Shellwords.escape(source_path)

   output_dirname = File.dirname(source_path)
   escaped_output_dirname = Shellwords.escape(output_dirname)
   puts("Output: #{escaped_output_dirname}")

   run("#{HANDBRAKE_PATH} -i #{escaped_source_path}")
end
