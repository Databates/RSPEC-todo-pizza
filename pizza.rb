class Pizza
  attr_reader :name, :description, :time_baked

  def initialize(name)
    @name = name
    @time_baked = 0
  end
end
