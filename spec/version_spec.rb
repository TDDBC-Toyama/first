require_relative '../version.rb'
describe Version do
  describe 'major 番号を与えて、major 番号を返す' do
    it { expect(Version.new(major: 1).major).to eq '1' }
    it { expect(Version.new(major: 2).major).to eq '2' }
  end

  describe 'minor 番号を与えて、minor 番号を返す' do
    it { expect(Version.new(minor: 1).minor).to eq '1' }
    it { expect(Version.new(minor: 2).minor).to eq '2' }
  end
end
