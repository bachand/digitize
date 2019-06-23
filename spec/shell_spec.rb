require 'shell.rb'

describe Shell do

  describe '#output' do

    it 'outputs something when the command outputs something' do
      expect(Shell.output('echo foo')).to eq("foo\n")
    end
  end

  describe '#run' do

    it 'returns true when the command exits succesfully' do
      expect(Shell.run('exit 0')).to be true
    end

    it 'returns false when the command exits unsuccessfully' do
      expect(Shell.run('exit 1')).to be false
    end
  end
end
