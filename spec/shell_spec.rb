require 'shell.rb'

describe Shell do

  describe '#output' do

    it 'outputs something when the command outputs something' do
      expect(Shell.output('echo foo')).to eq("foo\n")
    end
  end
end
