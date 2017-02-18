require_relative '../version.rb'
describe Version do
  context 'major 番号だけ 1 を与えた場合' do
    it { expect(Version.new(1).major).to eq '1' }
    it { expect(Version.new(1).minor).to eq '0' }
    it { expect(Version.new(1).patch).to eq '0' }
    it { expect(Version.new(1).semver).to eq '1.0.0' }
  end

  context 'minor 番号も加えて 1 と 4 を与えた場合' do
    it { expect(Version.new(1, 4).major).to eq '1' }
    it { expect(Version.new(1, 4).minor).to eq '4' }
    it { expect(Version.new(1, 4).patch).to eq '0' }
    it { expect(Version.new(1, 4).semver).to eq '1.4.0' }
  end

  context 'patch 番号も与えて、 1 と 4 と 2 を与えた場合' do
    it { expect(Version.new(1, 4, 2).major).to eq '1' }
    it { expect(Version.new(1, 4, 2).minor).to eq '4' }
    it { expect(Version.new(1, 4, 2).patch).to eq '2' }
    it { expect(Version.new(1, 4, 2).semver).to eq '1.4.2' }
  end
end
