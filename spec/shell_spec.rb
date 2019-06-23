require 'shell.rb'

describe Shell do

  describe '::output' do

    it 'outputs something when the command succeeds and writes to stdout' do
      expect(Shell.output('echo foo')).to eq("foo\n")
    end

    it 'raises an error when the command fails' do
      expect { Shell.output('exit 1') }.to raise_error('Command failed')
    end
  end

  describe '::run' do

    it 'returns true when the command exits successfully' do
      expect(Shell.run('exit 0')).to be true
    end

    it 'returns false when the command exits unsuccessfully' do
      expect(Shell.run('exit 1')).to be false
    end
  end
end
