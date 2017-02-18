class Version
  attr_accessor :major, :minor, :patch

  def initialize(major, minor = 0, patch = 0)
    @major, @minor, @patch = major.to_s, minor.to_s, patch.to_s
  end

end
