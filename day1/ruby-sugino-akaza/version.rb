class Version
  class VersionValidationError < StandardError; end
  def initialize(major, minor = 0, patch = 0)
    if (major < 0 || minor < 0)
      raise VersionValidationError, 'major にマイナスは指定できません' if major < 0
      raise VersionValidationError, 'major にマイナスは指定できません' if major < 0
      raise VersionValidationError, 'minor にマイナスは指定できません' if minor < 0
    end
    @major, @minor, @patch = major, minor, patch
  end

  def check_validation(num)
    if (num < 0)
      raise VersionValidationError, "#{num} にマイナスは指定できません"
    end
  end

  [:major, :minor, :patch].each do |method|
    define_method(method) do
      instance_variable_get(:"@#{method}").to_s
    end
  end

  def semver
    "#{@major}.#{@minor}.#{@patch}"
  end

  def ==(other)
    self.semver == other.semver
  end
end
