require 'tty-prompt'
require 'yaml'

class Manifest

  def create_via_prompt
    prompt = TTY::Prompt.new
    conference = prompt.ask('What is the conference name?')
    year = prompt.ask('What is the year of the conference?')

    recordings = []
    begin
      name = prompt.ask('What is the name of this recording?')

      speakers = []
      begin
        speaker = prompt.ask('Who spoke in this recording?')
        speakers << speaker
      end while prompt.yes?('More speakers?', default: false)

      data = []
      begin
        dvd_image = prompt.ask('What is the path to the DVD image?')
        title = prompt.ask('What title of the DVD is this recording associated with?').to_i
        data << {
          'dvd_image' => dvd_image,
          'title' => title,
        }
      end while prompt.yes?("More data paths?", default: false)

      recordings << {
        'name' => name,
        'speakers' => speakers,
        'data' => data,
      }
    end while prompt.yes?('More recordings?', default: false)

    create(conference, year, recordings)
  end

  private

  def create(conference, year, recordings)
    data = {
      'conference' => conference,
      'year' => year,
      'recordings' => recordings,
    }

    puts data.to_yaml
  end
end
