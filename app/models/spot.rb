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

  def select_top_spot(surfing_spots, current_conditions)
    spot_points = Hash.new(0)

    surfing_spots.each do |spot|
      conditions_met = true

      # Check Ideal Wind Direction
      ideal_wind_direction = (spot.lower_wind_direction..spot.upper_wind_direction)
      ideal_met = within_circular_range?(ideal_wind_direction, current_conditions[:wind_direction])
      spot_points[spot.spot_name] += 3 if ideal_met

      # Check Upper/Lower Wind Direction
      wind_met = spot.lower_wind_direction == current_conditions[:wind_direction] || spot.upper_wind_direction == current_conditions[:wind_direction]
      spot_points[spot.spot_name] += 1 if wind_met

      # Check Ideal Swell Direction
      ideal_swell_direction = (spot.lower_swell_direction..spot.upper_swell_direction)
      swell_direction_met = within_circular_range?(ideal_swell_direction, current_conditions[:swell_direction])
      spot_points[spot.spot_name] += 3 if swell_direction_met

      # Check Upper/Lower Swell Direction
      swell_met = spot.lower_swell_direction == current_conditions[:swell_direction] || spot.upper_swell_direction == current_conditions[:swell_direction]
      spot_points[spot.spot_name] += 1 if swell_met

      # Check Ideal Wave Force
      wave_force_met = spot.ideal_wave_force == current_conditions[:wave_force]
      spot_points[spot.spot_name] += 2 if wave_force_met

      # Check Ideal Tide
      tide_met = spot.ideal_tide == current_conditions[:tide]
      spot_points[spot.spot_name] += 5 if tide_met

      # Consider Wave Quality
      spot_points[spot.spot_name] += spot.wave_quality
    end

    sorted_spots = spot_points.sort_by { |_, points| -points }
    top_5_spots = sorted_spots.first(5)

    final_sorted_spots = top_5_spots.map { |spot, points| "#{spot}: #{points} points" }
    final_sorted_spots
  end
end
