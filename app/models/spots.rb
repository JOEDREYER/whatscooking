class SurfSpotSelector
  attr_accessor :surfing_spots, :current_conditions

  def initialize(surfing_spots, current_conditions)
    @surfing_spots = surfing_spots
    @current_conditions = current_conditions
  end

  def within_circular_range?(range, degree)
    return true if range.include?(degree)

    start, finish = range.first, range.last
    if start > finish
      # Handle ranges that wrap around 360 degrees
      (0..finish).include?(degree) || (start..360).include?(degree)
    else
      false
    end
  end

  def select_top_spot
    spot_points = Hash.new(0)

    # Step 1: Calculate initial points without wave quality
    surfing_spots.each do |spot|
      conditions_met = true

      spot.each do |condition, range|
        next if condition == :name # Skip the name key

        case condition
        when :adequate_wind_direction
          adequate_met = range.any? { |r| within_circular_range?(r, current_conditions[:wind_direction]) }
          puts "#{spot[:name]} adequate_wind_direction: #{adequate_met}" # Debug
          conditions_met &&= adequate_met
        when :ideal_wind_direction
          ideal_met = within_circular_range?(range, current_conditions[:wind_direction])
          puts "#{spot[:name]} ideal_wind_direction: #{ideal_met}" # Debug
          conditions_met &&= ideal_met
          spot_points[spot[:name]] += 3 if ideal_met
        when :ideal_wave_force
          wave_force_met = range.cover?(current_conditions[:wave_force])
          puts "#{spot[:name]} ideal_wave_force: #{wave_force_met}" # Debug
          spot_points[spot[:name]] += 2 if wave_force_met
          conditions_met &&= wave_force_met
        when :wind_speed
          wind_speed_met = range.cover?(current_conditions[:wind_speed])
          puts "#{spot[:name]} wind_speed: #{wind_speed_met}" # Debug
          spot_points[spot[:name]] += 1 if wind_speed_met
          conditions_met &&= wind_speed_met
        when :ideal_swell_direction
          swell_direction_met = range.cover?(current_conditions[:swell_direction])
          puts "#{spot[:name]} ideal_swell_direction: #{swell_direction_met}" # Debug
          spot_points[spot[:name]] += 3 if swell_direction_met
          conditions_met &&= swell_direction_met
        when :ideal_tide
          tide_met = range.cover?(current_conditions[:tide])
          puts "#{spot[:name]} ideal_tide: #{tide_met}" # Debug
          spot_points[spot[:name]] += 5 if tide_met
          conditions_met &&= tide_met
        else
          if range.is_a?(Range)
            condition_met = range.cover?(current_conditions[condition])
          else
            condition_met = range == current_conditions[condition]
          end
          puts "#{spot[:name]} #{condition}: #{condition_met}" # Debug
          conditions_met &&= condition_met
        end
      end

      puts conditions_met ? "Conditions met for #{spot[:name]}" : "Conditions not met for #{spot[:name]}"
    end

    # Step 2: Sort the spots and add wave quality to the top 5
    sorted_spots = spot_points.sort_by { |_, points| -points }
    top_5_spots = sorted_spots.first(5)

    top_5_spots.each do |spot, points|
      spot_data = surfing_spots.find { |s| s[:name] == spot }
      spot_points[spot] += spot_data[:wave_quality] if spot_data
    end

    # Step 3: Sort again to determine the top spot with the final points
    final_sorted_spots = spot_points.sort_by { |_, points| -points }
    final_sorted_spots.each do |spot, points|
      puts "#{spot}: #{points} points"
    end
  end
end


surfing_spots = [
  { name: "Bettys Bay", ideal_swell_direction: 190..260, ideal_wave_force: 3.5..3.5, ideal_wind_direction: 330..60, adequate_wind_direction: [320..330, 60..70], wind_speed: 0..40, ideal_tide: 1..2, wave_quality: 8 },
  { name: "Pringle Bay", ideal_swell_direction: 210..270, ideal_wave_force: 4..6, ideal_wind_direction: 100..160, adequate_wind_direction: [90..100, 160..170], wind_speed: 0..40, ideal_tide: 1..2, wave_quality: 8 },
  { name: "Cool Bay", ideal_swell_direction: 190..270, ideal_wave_force: 1.5..2.5, ideal_wind_direction: 70..130, adequate_wind_direction: [60..70, 130..140], wind_speed: 0..40, ideal_tide: 3..5, wave_quality: 6 },
  { name: "Gordons Bay", ideal_swell_direction: 190..235, ideal_wave_force: 4..7, ideal_wind_direction: 70..130, adequate_wind_direction: [60..70, 130..140], wind_speed: 0..40, ideal_tide: 3..5, wave_quality: 6.5 },
  { name: "Strand", ideal_swell_direction: 190..235, ideal_wave_force: 2..Float::INFINITY, ideal_wind_direction: 70..130, adequate_wind_direction: [60..70, 130..140], wind_speed: 0..40, ideal_tide: 3..5, wave_quality: 6 },
  { name: "Muizenberg", ideal_swell_direction: 190..225, ideal_wave_force: 2..6, ideal_wind_direction: 280..30, adequate_wind_direction: [270..280, 30..40], wind_speed: 0..40, ideal_tide: 3..5, wave_quality: 6 },
  { name: "Dangers", ideal_swell_direction: 170..210, ideal_wave_force: 2..6, ideal_wind_direction: 280..31, adequate_wind_direction: [270..280, 31..41], wind_speed: 0..40, ideal_tide: 3..5, wave_quality: 7 },
  { name: "Kalk Bay Reef", ideal_swell_direction: 170..210, ideal_wave_force: 2..6, ideal_wind_direction: 280..32, adequate_wind_direction: [270..280, 32..42], wind_speed: 0..40, ideal_tide: 3..5, wave_quality: 8 },
  { name: "Black Rocks", ideal_swell_direction: 170..210, ideal_wave_force: 3..6, ideal_wind_direction: 280..33, adequate_wind_direction: [270..280, 33..43], wind_speed: 0..40, ideal_tide: 3..5, wave_quality: 7.5 },
  { name: "Dias Beach", ideal_swell_direction: 190..225, ideal_wave_force: 1..2, ideal_wind_direction: 280..34, adequate_wind_direction: [270..280, 34..44], wind_speed: 0..40, ideal_tide: 1..2, wave_quality: 5 },
  { name: "Platboom", ideal_swell_direction: 205..270, ideal_wave_force: 2.5..4.5, ideal_wind_direction: 280..35, adequate_wind_direction: [270..280, 35..45], wind_speed: 0..40, ideal_tide: 3..5, wave_quality: 8 },
  { name: "Extensions", ideal_swell_direction: 220..270, ideal_wave_force: 2.5..4.5, ideal_wind_direction: 90..146, adequate_wind_direction: [80..90, 146..156], wind_speed: 0..40, ideal_tide: 3..5, wave_quality: 7.5 },
  { name: "Scarborough", ideal_swell_direction: 205..270, ideal_wave_force: 2.5..4.5, ideal_wind_direction: 90..146, adequate_wind_direction: [80..90, 146..156], wind_speed: 0..40, ideal_tide: 3..5, wave_quality: 6.5 },
  { name: "Misty Cliffs", ideal_swell_direction: 205..270, ideal_wave_force: 2.5..4.5, ideal_wind_direction: 0..85, adequate_wind_direction: [350..0, 85..95], wind_speed: 0..40, ideal_tide: 3..5, wave_quality: 5 },
  { name: "Outer Kom", ideal_swell_direction: 205..270, ideal_wave_force: 2.5..4.5, ideal_wind_direction: 90..146, adequate_wind_direction: [80..90, 146..156], wind_speed: 0..40, ideal_tide: 3..5, wave_quality: 7 },
  { name: "Inner Kom", ideal_swell_direction: 205..270, ideal_wave_force: 2.5..4.5, ideal_wind_direction: 90..146, adequate_wind_direction: [80..90, 146..156], wind_speed: 0..40, ideal_tide: 3..5, wave_quality: 5 },
  { name: "Long Beach", ideal_swell_direction: 205..270, ideal_wave_force: 2.5..5, ideal_wind_direction: 90..146, adequate_wind_direction: [80..90, 146..156], wind_speed: 0..40, ideal_tide: 1..2, wave_quality: 8 },
  { name: "Dunes", ideal_swell_direction: 215..270, ideal_wave_force: 2..4.5, ideal_wind_direction: 90..146, adequate_wind_direction: [80..90, 146..156], wind_speed: 0..40, ideal_tide: 1..2, wave_quality: 9 },
  { name: "Hoek", ideal_swell_direction: 215..270, ideal_wave_force: 2..3.5, ideal_wind_direction: 90..146, adequate_wind_direction: [80..90, 146..156], wind_speed: 0..40, ideal_tide: 1..2, wave_quality: 8 },
  { name: "Sandy Bay", ideal_swell_direction: 215..270, ideal_wave_force: 3..4.5, ideal_wind_direction: 90..146, adequate_wind_direction: [80..90, 146..156], wind_speed: 0..40, ideal_tide: 1..2, wave_quality: 9 },
  { name: "Llandudno", ideal_swell_direction: 215..270, ideal_wave_force: 1.8..3, ideal_wind_direction: 90..146, adequate_wind_direction: [80..90, 146..156], wind_speed: 0..40, ideal_tide: 1..3, wave_quality: 7 },
  { name: "Glen Beach", ideal_swell_direction: 200..270, ideal_wave_force: 2..3, ideal_wind_direction: 90..146, adequate_wind_direction: [80..90, 146..156], wind_speed: 0..40, ideal_tide: 1..3, wave_quality: 5.5 },
  { name: "Queens Beach", ideal_swell_direction: 215..270, ideal_wave_force: 1.5..2.5, ideal_wind_direction: 90..146, adequate_wind_direction: [80..90, 146..156], wind_speed: 0..40, ideal_tide: 3..5, wave_quality: 4.5 },
  { name: "Sollys", ideal_swell_direction: 215..270, ideal_wave_force: 1.5..2.5, ideal_wind_direction: 90..146, adequate_wind_direction: [80..90, 146..156], wind_speed: 0..40, ideal_tide: 3..5, wave_quality: 7 },
  { name: "Off The Wall", ideal_swell_direction: 215..270, ideal_wave_force: 2..4, ideal_wind_direction: 90..146, adequate_wind_direction: [80..90, 146..156], wind_speed: 0..40, ideal_tide: 3..5, wave_quality: 9 },
  { name: "Thermos", ideal_swell_direction: 215..270, ideal_wave_force: 3..4, ideal_wind_direction: 90..146, adequate_wind_direction: [80..90, 146..156], wind_speed: 0..40, ideal_tide: 3..5, wave_quality: 7 },
  { name: "Derdersteen", ideal_swell_direction: 215..270, ideal_wave_force: 1.5..4, ideal_wind_direction: 0..130, adequate_wind_direction: [350..0, 100..110], wind_speed: 0..40, ideal_tide: 1..2, wave_quality: 8.5 },
  { name: "Elands Bay", ideal_swell_direction: 215..270, ideal_wave_force: 2..5, ideal_wind_direction: 90..146, adequate_wind_direction: [80..90, 146..156], wind_speed: 0..40, ideal_tide: 1..5, wave_quality: 9 }
]


current_conditions = {
  swell_direction: 216,
  wave_force: 1.6,
  wind_direction: 129,
  wind_speed: 13,
  tide: 2
}

selector = SurfSpotSelector.new(surfing_spots, current_conditions)
selector.select_top_spot

# points:
