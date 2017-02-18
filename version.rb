class Version
  def initialize(major, minor = 0, patch = 0)
    @major, @minor, @patch = major, minor, patch
  end

  [:major, :minor, :patch].each do |method|
    define_method(method) do
      instance_variable_get(:"@#{method}").to_s
    end
  end

  def semver
    [@major, @minor, @patch].join('.')
  end
end
