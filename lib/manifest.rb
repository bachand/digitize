require 'json'

class Manifest

  def create
    conference = 'My Conference'
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
