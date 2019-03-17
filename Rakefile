# These commands require you first to run `brew bundle` in this repo.

HANDBRAKE_PREFIX = `brew --prefix handbrake`.strip
HANDBRAKE_PATH = File.join(HANDBRAKE_PREFIX, 'bin/HandbrakeCLI')

desc 'Transcode a video from one format to the another'
task :transcode, [:source_path] do |task, args|
   puts args[:source_path]
   # puts `#{HANDBRAKE_PATH} --version`
end
