class Version
  attr_accessor :major, :minor, :patch

  def initialize(major: nil, minor: nil, patch: nil)
    @major, @minor, @patch = major.to_s, minor.to_s, patch.to_s
  end
end
