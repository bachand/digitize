require 'shellwords'

require_relative 'lib/common.rb'

# These commands require you first to run `brew bundle` in this repo.

HANDBRAKE_PREFIX = `brew --prefix handbrake`.strip
HANDBRAKE_PATH = File.join(HANDBRAKE_PREFIX, 'bin/HandbrakeCLI')

desc 'Transcode a video from one format to the another'
task :transcode, [:source_path] do |task, args|
   source_path = args[:source_path]
   warning('Missing source path.') unless source_path
   warning("#{source_path} does not exist.") unless File.exist?(source_path)
   escaped_source_path = Shellwords.escape(source_path)

   info("hello info")
   warning("hello warning")
   error("hello error")
   puts escaped_source_path
   run("#{HANDBRAKE_PATH} --version")
end
