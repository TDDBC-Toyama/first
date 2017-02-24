require 'spec_helper'

RSpec.describe Semver do
  VERSION_PARAM = [:major, :minor, :patch].freeze
  VERSION_EX_142 = { major: 1, minor: 4, patch: 2 }.freeze
  VERSION_EX_210 = { major: 2, minor: 1, patch: 0 }.freeze

  describe 'Versionオブジェクトを作成できる' do
    it 'インスタンスが生成できる' do
      expect(Semver::Version.new).not_to eq nil
    end

    # 必要なプロパティ一覧を回す
    VERSION_PARAM.each do |prop|
      it "#{prop} のpropertyを持つ" do
        version_object = Semver::Version.new
        expect(version_object.respond_to?(prop)).to eq true
      end
    end

    it '文字列表現を取得できるaaaaa' do
      version_object = Semver::Version.new
      expect(version_object.generate_string.is_a?(String)).to eq true
    end

    it 'Version作成時にmajor, minor, patch に値を指定できる' do
      version_object = Semver::Version.new(major: 1, minor: 2, patch: 3)
      expect(version_object).not_to eq nil
    end
  end

  describe '文字列表現を取得できる' do
    #   subject { Semver::Version.new(major: 1, minor: 4, patch: 2) }
    #   its(:major) { should == 1 }
    #   its(:minor) { should == 4 }
    #   its(:pstch) { should == 2 }
    # end
    it '作成時のmajor, minor, patch のpropertyが読み出せる すなわち それぞれ 1, 4, 2 を与えてバージョン 1.4.2 のオブジェクトを作成' do
      VERSION_EX_142.keys.each do |prop|
        version_object = Semver::Version.new(VERSION_EX_142)
        expect(version_object.send(prop)).to eq VERSION_EX_142[prop]
      end
    end

    it 'バージョン 1.4.2 の文字列表現は文字列 "1.4.2"' do
      param = VERSION_EX_142
      version_object = Semver::Version.new(param)
      expect(version_object.generate_string).to eq '1.4.2'
    end
  end

  describe '他バージョンオブジェクトと比較できる' do
    it 'バージョン 1.4.2 は バージョン 2.1.0 と等しくない' do
      version_object_142 = Semver::Version.new(VERSION_EX_142)
      version_object_210 = Semver::Version.new(VERSION_EX_210)
      expect(version_object_142.compare(version_object_210)).to eq false
    end

    it 'バージョン 2.1.0 は バージョン 2.1.nil と等しい' do
      version_object_2_1_0 = Semver::Version.new(VERSION_EX_210)
      version_object_2_1_nil = Semver::Version.new(major: 2, minor: 1, patch: nil)
      expect(version_object_2_1_0.compare(version_object_2_1_nil)).to eq true
    end

    it 'バージョン 1.4.2 は バージョン 1.4.2 と等しい' do
      version_object_142   = Semver::Version.new(VERSION_EX_142)
      version_object_142_2 = Semver::Version.new(VERSION_EX_142)
      expect(version_object_142.compare(version_object_142_2)).to eq true
    end
  end

  describe '例外の判定' do
    it '受け入れられる値か（0以上の整数）を調べられる' do
      expect(Semver::Version.acceptable?(0)).to eq(true)
      expect(Semver::Version.acceptable?(nil)).to eq(true)

      expect(Semver::Version.acceptable?(-1)).to eq(false)
      expect(Semver::Version.acceptable?(1.0)).to eq(false)
      expect(Semver::Version.acceptable?('1')).to eq(false)
      expect(Semver::Version.acceptable?('bugfix-version')).to eq(false)
    end

    it 'インスタンス生成時に受け付けられる値を投げると例外が出ない' do
      expect { Semver::Version.new }.not_to raise_error
    end

    it 'インスタンス生成時に受け付けられないmajor値を投げるとArgumentError例外が出る' do
      invalid_param = { major: -1 }
      expect { Semver::Version.new(invalid_param) }.to raise_error(ArgumentError)
    end

    it 'インスタンス生成時に受け付けられないminor値を投げるとArgumentError例外が出る' do
      invalid_param = { minor: -1 }
      expect { Semver::Version.new(invalid_param) }.to raise_error(ArgumentError)
    end

    it 'インスタンス生成時に受け付けられないpatch値を投げるとArgumentError例外が出る' do
      invalid_param = { patch: -1 }
      expect { Semver::Version.new(invalid_param) }.to raise_error(ArgumentError)
    end
  end
end
