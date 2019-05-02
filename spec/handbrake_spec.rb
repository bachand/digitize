require 'handbrake.rb'

describe HandBrake do

  describe '#encode' do

    it 'invokes the CLI correctly' do
      source_path = '/src/path'
      output_path = '/output/path'
      preset_path = '/preset_path'
      preset_name = 'preset_name'

      regex = /HandbrakeCLI.*#{preset_path}.*#{preset_name}.*#{source_path}.*#{output_path}/

      expect(Kernel).to receive(:system).with(regex).and_return(true)

      subject.encode(source_path, output_path, preset_path, preset_name)
    end
  end
end
