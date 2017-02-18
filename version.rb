class Version
  attr_accessor :major, :minor

  def initialize(major: nil, minor: nil)
    @major, @minor = major.to_s, minor.to_s
  end
end
