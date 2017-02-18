class Version
  attr_accessor :major

  def initialize(major:)
    @major = major.to_s
  end
end
