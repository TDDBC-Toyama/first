class Version
  def initialize(major, minor = 0, patch = 0)
    @major, @minor, @patch = major, minor, patch
  end

  def major
    @major.to_s
  end

  def minor
    @minor.to_s
  end

  def patch
    @patch.to_s
  end

  def semver
    [@major, @minor, @patch].join('.')
  end
end
