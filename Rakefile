require 'shellwords'

require_relative 'lib/common.rb'
require_relative 'lib/handbrake.rb'
require_relative 'lib/manifest.rb'

# These commands require you first to run `brew bundle` in this repo.

desc 'Transcode a video from one format to the another'
task :transcode, [:source_path] do |task, args|
   source_path = args[:source_path]
   error_and_exit('Missing source path.') unless source_path
   error_and_exit("#{source_path} does not exist.") unless File.exist?(source_path)
   error_and_exit('Source must be a file.') unless Pathname.new(source_path).file?

   output_dirname = File.dirname(source_path)
   output_path = File.join(output_dirname, 'out.m4v')

   preset_path = 'config/handbrake_dvd_export.json'
   preset_name = 'handbrake_dvd_export'

   HandBrake.new().encode(source_path, output_path, preset_path, preset_name)
end

desc 'Creates a JSON manifest file'
task :manifest do
  Manifest.new().create_via_prompt()
end
