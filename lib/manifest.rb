require 'json'
require 'tty-prompt'

class Manifest

  def create_via_prompt
    prompt = TTY::Prompt.new
    conference = prompt.ask('What is the conference name?')
    create(conference)
  end

  private

  def create(conference)
    title = 'Tigers and Lions and Bears'
    speakers = [
      'Sylvester Stallone',
      'Dolph Lundgren',
    ]
    data_paths = [
      'TheRecording.dmg'
    ]

    data = {
      'conference' => conference,
      'title' => title,
      'speakers' => speakers,
      'data_paths' => data_paths,
    }

    puts JSON.generate(data)
  end
end
