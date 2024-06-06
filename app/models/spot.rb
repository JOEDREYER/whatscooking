class Spot < ApplicationRecord
  def within_circular_range?(range, degree)
    return true if range.include?(degree)

    start, finish = range.first, range.last
    if start > finish
      (0..finish).include?(degree) || (start..360).include?(degree)
    else
      false
    end
  end

  def ideal_swell_direction
    range = read_attribute(:ideal_swell_direction)
    Range.new(*range.split("..").map(&:to_i))
  end

  def lower_swell_direction
    range = read_attribute(:lower_swell_direction)
    Range.new(*range.split("..").map(&:to_i))
  end

  def upper_swell_direction
    range = read_attribute(:upper_swell_direction)
    Range.new(*range.split("..").map(&:to_i))
  end

  def ideal_wind_direction
    range = read_attribute(:ideal_wind_direction)
    Range.new(*range.split("..").map(&:to_i))
  end

  def lower_wind_direction
    range = read_attribute(:lower_wind_direction)
    Range.new(*range.split("..").map(&:to_i))
  end

  def upper_wind_direction
    range = read_attribute(:upper_wind_direction)
    Range.new(*range.split("..").map(&:to_i))
  end

  def ideal_wave_force
    range = read_attribute(:ideal_wave_force)
    Range.new(*range.split("..").map(&:to_f))
  end
end
