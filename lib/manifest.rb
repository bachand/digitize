require 'json'
require 'tty-prompt'

class Manifest

  def create_via_prompt
    prompt = TTY::Prompt.new
    conference = prompt.ask('What is the conference name?')
    title = prompt.ask('What is the title of the recording?')
    speakers = []
    begin
      speaker = prompt.ask('Who spoke at the conference?')
      speakers << speaker
    end while prompt.yes?("continue?", default: false)
    data_paths = []
    begin
      data_path = prompt.ask('What are the data paths?')
      data_paths << data_path
    end while prompt.yes?("continue?", default: false)

    create(conference, title, speakers, data_paths)
  end

  private

  def create(conference, title, speakers, data_paths)
    data = {
      'conference' => conference,
      'title' => title,
      'speakers' => speakers,
      'data_paths' => data_paths,
    }

    puts JSON.generate(data)
  end
end
