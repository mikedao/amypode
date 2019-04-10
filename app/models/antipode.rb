class Antipode
  attr_reader :id
  def initialize(reference_lat, reference_long)
    @reference_lat = reference_lat.to_f
    @reference_long = reference_long.to_f
    @id = 1
  end

  def lat
    @reference_lat * -1
  end

  def long
    long = 180 - @reference_long.abs
    if long > 0 && @reference_long > 0
      long  = long * -1
    elsif long < 0 && @reference_long < 0
      long = long * -1
    end
    long
  end
end
