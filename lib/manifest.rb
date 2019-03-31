require 'json'

class Manifest

  def create
    data = {
      'manifest' => 'dummy'
    }
    puts JSON.generate(data)
  end
end
