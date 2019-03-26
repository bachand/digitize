require 'shellwords'

require_relative 'lib/common.rb'
require_relative 'lib/handbrake.rb'

# These commands require you first to run `brew bundle` in this repo.

desc 'Transcode a video from one format to the another'
task :transcode, [:source_path] do |task, args|
   source_path = args[:source_path]
   error_and_exit('Missing source path.') unless source_path
   error_and_exit("#{source_path} does not exist.") unless File.exist?(source_path)
   error_and_exit('Source must be a file.') unless Pathname.new(source_path).file?

   output_dirname = File.dirname(source_path)
   output_path = File.join('out.mp4')

   HandBrake.new().encode(source_path, output_path)
end
