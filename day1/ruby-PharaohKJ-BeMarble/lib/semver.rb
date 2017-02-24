require 'semver/version'

module Semver
  # Your code goes here...
  class Version
    attr_reader :major, :minor, :patch
    def initialize(major: 0, minor: 0, patch: 0)
      raise ArgumentError, 'major error' unless acceptable?(major)
      raise ArgumentError, 'minor error' unless acceptable?(minor)
      raise ArgumentError, 'patch error' unless acceptable?(patch)

      @major = major.to_i
      @minor = minor.to_i
      @patch = patch.to_i
    end

    def generate_string
      "#{@major}.#{@minor}.#{@patch}"
    end

    def compare(version_object)
      generate_string == version_object.generate_string
    end

    def self.acceptable?(target)
      return true if target.nil?
      return false unless (target =~ /\D+/).nil?
      target.to_i >= 0
    end

    def acceptable?(target)
      self.class.acceptable?(target)
    end
  end
end
