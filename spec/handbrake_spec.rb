require 'handbrake.rb'

describe HandBrake do

  describe '#num_titles' do

    context 'for a DVD with one title' do
      it 'returns one title' do
        fixture_path = File.dirname(__FILE__) + '/handbrake_fixtures/scan_1-title.txt'
        fixture_data = File.read(fixture_path)
        allow(Shell).to receive(:output).and_return(fixture_data)
        expect(subject.num_titles('/fake/path.dmg')).to eq(1)
      end
    end

    context 'for a DVD with three titles' do
      it 'returns three titles' do
        fixture_path = File.dirname(__FILE__) + '/handbrake_fixtures/scan_3-titles.txt'
        fixture_data = File.read(fixture_path)
        allow(Shell).to receive(:output).and_return(fixture_data)
        expect(subject.num_titles('/fake/path.dmg')).to eq(3)
      end
    end
  end

  describe '#encode' do

    it 'invokes the CLI correctly' do
      source_path = '/src/path'
      output_path = '/output/path'
      preset_path = '/preset_path'
      preset_name = 'preset_name'

      regex = /HandbrakeCLI.*#{preset_path}.*#{preset_name}.*#{source_path}.*#{output_path}/

      allow(subject).to receive(:num_titles).and_return(1)
      expect(Kernel).to receive(:system).with(regex).and_return(true)

      subject.encode(source_path, output_path, preset_path, preset_name)
    end
  end
end
