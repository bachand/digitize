require 'tty-prompt'
require 'yaml'

class Manifest

  def create_via_prompt
    prompt = TTY::Prompt.new
    conference = prompt.ask('What is the conference name?')
    year = prompt.ask('What is the year of the conference?')
    data_paths = []
    begin
      data_path = prompt.ask('What are the data paths?')
      data_paths << data_path
    end while prompt.yes?("More data paths?", default: false)
    titles = []
    begin
      title = prompt.ask('What is the title of the recording?')
      speakers = []
      begin
        speaker = prompt.ask('Who spoke in this recording?')
        speakers << speaker
      end while prompt.yes?("More speakers?", default: false)
      titles << {
        'title' => title,
        'speakers' => speakers,
      }
    end while prompt.yes?("More titles?", default: false)

    create(conference, year, titles, data_paths)
  end

  private

  def create(conference, year, titles, data_paths)
    data = {
      'conference' => conference,
      'year' => year,
      'titles' => titles,
      'data_paths' => data_paths,
    }

    puts data.to_yaml
  end
end
