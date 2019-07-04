require 'handbrake.rb'
require 'tty-prompt'

describe HandBrake do

  before(:each) do
    allow_any_instance_of(Object).to receive(:info)
    allow_any_instance_of(Object).to receive(:warning)
    allow_any_instance_of(Object).to receive(:error)
  end

  describe '#num_titles' do

    context 'for a DVD with one title' do

      before(:each) do
        fixture_path = File.dirname(__FILE__) + '/handbrake_fixtures/scan_1-title.txt'
        fixture_data = File.read(fixture_path)
        allow(Shell).to receive(:output).and_return(fixture_data)
      end

      it 'returns one title' do
        expect(subject.num_titles('/fake/path.dmg')).to eq(1)
      end
    end

    context 'for a DVD with three titles' do

      before(:each) do
        fixture_path = File.dirname(__FILE__) + '/handbrake_fixtures/scan_3-titles.txt'
        fixture_data = File.read(fixture_path)
        allow(Shell).to receive(:output).and_return(fixture_data)
      end

      it 'returns three titles' do
        expect(subject.num_titles('/fake/path.dmg')).to eq(3)
      end
    end
  end

  describe '#encode' do

    before(:each) {
      @prompt = TTY::Prompt.new
      allow(TTY::Prompt).to receive(:new).and_return(@prompt)

      @source_path = '/src/path'
      @output_path = '/output/path'
      @preset_path = '/preset_path'
      @preset_name = 'preset_name'
    }

    it 'invokes the CLI correctly' do
      regex = /HandbrakeCLI.*--title 0.*#{@preset_path}.*#{@preset_name}.*#{@source_path}.*#{@output_path}/

      allow(subject).to receive(:num_titles).and_return(1)
      expect(Kernel).to receive(:system).with(regex).and_return(true)

      subject.encode(@source_path, @output_path, @preset_path, @preset_name)
    end

    context 'for a DVD with one title' do

      before(:each) do
        fixture_path = File.dirname(__FILE__) + '/handbrake_fixtures/scan_1-title.txt'
        fixture_data = File.read(fixture_path)
        allow(Shell).to receive(:output).and_return(fixture_data)
      end

      it 'does not prompt to choose a title' do
        allow(Kernel).to receive(:system)
        expect(@prompt).not_to receive(:yes?)

        subject.encode(@source_path, @output_path, @preset_path, @preset_name)
      end
    end

    context 'for a DVD with three titles' do

      before(:each) do
        fixture_path = File.dirname(__FILE__) + '/handbrake_fixtures/scan_3-titles.txt'
        fixture_data = File.read(fixture_path)
        allow(Shell).to receive(:output).and_return(fixture_data)
      end

      it 'prompts to choose a title' do
        allow(Kernel).to receive(:system)
        expect(@prompt).to receive(:select)

        subject.encode(@source_path, @output_path, @preset_path, @preset_name)
      end

      context 'when the user selects a title' do
        before(:each) do
          # select the second title
          expect(@prompt).to receive(:select).and_return(1)
        end

        it 'invokes the CLI correctly' do
          regex = /HandbrakeCLI.*--title 1.*#{@preset_path}.*#{@preset_name}.*#{@source_path}.*#{@output_path}/

          expect(Kernel).to receive(:system).with(regex).and_return(true)

          subject.encode(@source_path, @output_path, @preset_path, @preset_name)
        end
      end
    end
  end
end
