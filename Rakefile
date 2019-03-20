require 'shellwords'

require_relative 'lib/common.rb'

# These commands require you first to run `brew bundle` in this repo.

HANDBRAKE_PREFIX = `brew --prefix handbrake`.strip
HANDBRAKE_PATH = File.join(HANDBRAKE_PREFIX, 'bin/HandbrakeCLI')

desc 'Transcode a video from one format to the another'
task :transcode, [:source_path] do |task, args|
   warning('Missing source path.') unless args[:source_path]
   source_path = Shellwords.escape(args[:source_path])

   info("hello info")
   warning("hello warning")
   error("hello error")
   puts source_path
   run("#{HANDBRAKE_PATH} --version")
end
