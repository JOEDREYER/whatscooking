# class Spot
#   attr_accessor :name, :ideal_swell_direction, :ideal_wave_force, :ideal_wind_direction, :adequate_wind_direction, :wind_speed, :ideal_tide, :wave_quality

#   def initialize(attributes)
#     @name = attributes[:name]
#     @ideal_swell_direction = attributes[:ideal_swell_direction]
#     @ideal_wave_force = attributes[:ideal_wave_force]
#     @ideal_wind_direction = attributes[:ideal_wind_direction]
#     @adequate_wind_direction = attributes[:adequate_wind_direction]
#     @wind_speed = attributes[:wind_speed]
#     @ideal_tide = attributes[:ideal_tide]
#     @wave_quality = attributes[:wave_quality]
#   end

#   def self.calculate_wave_force(current_conditions)
#     swell_period = current_conditions[:swell_period]
#     wave_force = if swell_period > 18
#                    current_conditions[:swell_size] + 2
#                  elsif swell_period > 15
#                    current_conditions[:swell_size] + 1.5
#                  elsif swell_period > 12
#                    current_conditions[:swell_size] + 1
#                  else
#                    current_conditions[:swell_size]
#                  end
#                  p current_conditions[:swell_size]
#     current_conditions[:swell_size] = wave_force
#     p
#   end

#   def self.calculate_top_spot(current_conditions)
#     self.calculate_wave_force(current_conditions)
#     # p wave_force
#     surfing_spots = [
#       {
#         name: "Bettys Bay",
#         ideal_swell_direction: 190..260,
#         ideal_wave_force: 3..5,
#         ideal_wind_direction: 330..60,
#         adequate_wind_direction: [320..330, 60..70],
#         wind_speed: 0..40,
#         ideal_tide: 1..2,
#         wave_quality: 8
#       },
#       {
#         name: "Pringle Bay",
#         ideal_swell_direction: 210..270,
#         ideal_wave_force: 4..6,
#         ideal_wind_direction: 100..160,
#         adequate_wind_direction: [90..100, 160..170],
#         wind_speed: 0..35,
#         ideal_tide: 1..2,
#         wave_quality: 6
#       },
#       {
#         name: "Cool Bay",
#         ideal_swell_direction: 190..270,
#         ideal_wave_force: 1.5..2.5,
#         ideal_wind_direction: 70..130,
#         adequate_wind_direction: [60..70, 130..140],
#         wind_speed: 0..25,
#         ideal_tide: 1..2,
#         wave_quality: 6
#       },
#       {
#         name: "Gordons Bay",
#         ideal_swell_direction: 190..235,
#         ideal_wave_force: 4..7,
#         ideal_wind_direction: 70..130,
#         adequate_wind_direction: [60..70, 130..140],
#         ideal_tide: 3..5,
#         wave_quality: 6.5
#       },
#       {
#         name: "Strand",
#         ideal_swell_direction: 190..235,
#         ideal_wave_force: 2..6,
#         ideal_wind_direction: 70..130,
#         adequate_wind_direction: [60..70, 130..140],
#         ideal_tide: 3..5,
#         wave_quality: 6
#       },
#       {
#         name: "Muizenberg",
#         ideal_swell_direction: 190..225,
#         ideal_wave_force: 2..6,
#         ideal_wind_direction: 280..30,
#         adequate_wind_direction: [270..280, 30..40],
#         ideal_tide: 3..5,
#         wave_quality: 6
#       },
#       {
#         name: "Dangers",
#         ideal_swell_direction: 170..210,
#         ideal_wave_force: 2.5..6,
#         ideal_wind_direction: 280..31,
#         adequate_wind_direction: [270..280, 31..41],
#         ideal_tide: 3..5,
#         wave_quality: 7
#       },
#       {
#         name: "Kalk Bay Reef",
#         ideal_swell_direction: 170..210,
#         ideal_wave_force: 2..6,
#         ideal_wind_direction: 280..32,
#         adequate_wind_direction: [270..280, 32..42],
#         ideal_tide: 3..5,
#         wave_quality: 8
#       },
#       {
#         name: "Black Rocks",
#         ideal_swell_direction: 170..210,
#         ideal_wave_force: 3..6,
#         ideal_wind_direction: 280..33,
#         adequate_wind_direction: [270..280, 33..43],
#         ideal_tide: 3..5,
#         wave_quality: 8
#       },
#       {
#         name: "Dias Beach",
#         ideal_swell_direction: 190..225,
#         ideal_wave_force: 1..2,
#         ideal_wind_direction: 280..34,
#         adequate_wind_direction: [270..280, 34..44],
#         ideal_tide: 1..2,
#         wave_quality: 5
#       },
#       {
#         name: "Platboom",
#         ideal_swell_direction: 205..270,
#         ideal_wave_force: 2.5..4.5,
#         ideal_wind_direction: 280..35,
#         adequate_wind_direction: [270..280, 35..45],
#         ideal_tide: 3..5,
#         wave_quality: 8
#       },
#       {
#         name: "Extensions",
#         ideal_swell_direction: 220..270,
#         ideal_wave_force: 2.5..4.5,
#         ideal_wind_direction: 90..146,
#         adequate_wind_direction: [80..90, 146..156],
#         ideal_tide: 3..5,
#         wave_quality: 7.5
#       },
#       {
#         name: "Scarborough",
#         ideal_swell_direction: 205..270,
#         ideal_wave_force: 2.5..4.5,
#         ideal_wind_direction: 90..146,
#         adequate_wind_direction: [80..90, 146..156],
#         ideal_tide: 3..5,
#         wave_quality: 6.5
#       },
#       {
#         name: "Misty Cliffs",
#         ideal_swell_direction: 205..270,
#         ideal_wave_force: 2.5..4.5,
#         ideal_wind_direction: 0..85,
#         adequate_wind_direction: [350..0, 85..95],
#         ideal_tide: 3..5,
#         wave_quality: 5
#       },
#       {
#         name: "Outer Kom",
#         ideal_swell_direction: 205..270,
#         ideal_wave_force: 2.5..4.5,
#         ideal_wind_direction: 90..146,
#         adequate_wind_direction: [80..90, 146..156],
#         ideal_tide: 3..5,
#         wave_quality: 7
#       },
#       {
#         name: "Inner Kom",
#         ideal_swell_direction: 205..270,
#         ideal_wave_force: 2.5..4.5,
#         ideal_wind_direction: 90..146,
#         adequate_wind_direction: [80..90, 146..156],
#         ideal_tide: 3..5,
#         wave_quality: 5
#       },
#       {
#         name: "Long Beach",
#         ideal_swell_direction: 205..270,
#         ideal_wave_force: 2.5..5,
#         ideal_wind_direction: 90..146,
#         adequate_wind_direction: [80..90, 146..156],
#         ideal_tide: 1..2,
#         wave_quality: 7
#       },
#       {
#         name: "Dunes",
#         ideal_swell_direction: 215..270,
#         ideal_wave_force: 2.5..4.5,
#         ideal_wind_direction: 90..146,
#         adequate_wind_direction: [80..90, 146..156],
#         ideal_tide: 1..2,
#         wave_quality: 9
#       },
#       {
#         name: "Hoek",
#         ideal_swell_direction: 215..270,
#         ideal_wave_force: 2..3.5,
#         ideal_wind_direction: 90..146,
#         adequate_wind_direction: [80..90, 146..156],
#         ideal_tide: 1..2,
#         wave_quality: 8
#       },
#       {
#         name: "Sandy Bay",
#         ideal_swell_direction: 215..270,
#         ideal_wave_force: 3..4.5,
#         ideal_wind_direction: 90..146,
#         adequate_wind_direction: [80..90, 146..156],
#         ideal_tide: 1..2,
#         wave_quality: 8
#       },
#       {
#         name: "Llandudno",
#         ideal_swell_direction: 215..270,
#         ideal_wave_force: 1.8..3,
#         ideal_wind_direction: 90..146,
#         adequate_wind_direction: [80..90, 146..156],
#         ideal_tide: 1..2,
#         wave_quality: 7
#       },
#       {
#         name: "Glen Beach",
#         ideal_swell_direction: 200..270,
#         ideal_wave_force: 2.5..4.5,
#         ideal_wind_direction: 90..146,
#         adequate_wind_direction: [80..90, 146..156],
#         ideal_tide: 1..2,
#         wave_quality: 7
#       },
#       {
#         name: "The Base",
#         ideal_swell_direction: 200..270,
#         ideal_wave_force: 2.5..4.5,
#         ideal_wind_direction: 90..146,
#         adequate_wind_direction: [80..90, 146..156],
#         ideal_tide: 1..2,
#         wave_quality: 7
#       },
#       {
#         name: "Off The Wall",
#         ideal_swell_direction: 210..270,
#         ideal_wave_force: 2.5..4.5,
#         ideal_wind_direction: 90..146,
#         adequate_wind_direction: [80..90, 146..156],
#         ideal_tide: 1..2,
#         wave_quality: 7
#       }
#     ]

#     spot_points = Hash.new(0)

#     surfing_spots.each do |spot|
#       conditions_met = true

#       spot.each do |condition, range|
#         next if condition == :name # Skip the name key
#         if condition == :adequate_wind_direction
#           adequate_met = range.any? { |r| r.cover?(current_conditions[:ideal_wind_direction]) }
#           puts "#{spot[:name]} adequate_wind_direction: #{adequate_met}"
#           conditions_met &&= adequate_met
#         else
#           conditions_met &&= range.cover?(current_conditions[condition])
#           puts "#{spot[:name]} #{condition}: #{conditions_met}"
#         end
#         if condition == :ideal_wind_direction && conditions_met
#           spot_points[spot[:name]] += 3
#         elsif condition == :ideal_wave_force && conditions_met
#           spot_points[spot[:name]] += 2
#         elsif condition == :wind_speed && conditions_met
#           spot_points[spot[:name]] += 1
#         elsif condition == :ideal_swell_direction && conditions_met
#           spot_points[spot[:name]] += 3
#         end
#       end

#       if conditions_met
#         spot_points[spot[:name]] += spot[:wave_quality]
#         puts "Conditions met for #{spot[:name]}"
#       end
#     end

#     sorted_spots = spot_points.sort_by { |_, points| -points }
#     sorted_spots.each do |spot, points|
#       puts "#{spot}: #{points} points"
#     end
#   end
# end

# # Example usage:
# current_conditions = {
#   swell_size: 2,
#   ideal_swell_direction: 250,
#   swell_period: 18,
#   ideal_wind_direction: 100,
#   wind_speed: 20,
#   ideal_tide: 5
# }

# Spot.calculate_top_spot(current_conditions)

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

      if conditions_met
        spot_points[spot[:name]] += spot[:wave_quality]
        puts "Conditions met for #{spot[:name]}"
      else
        puts "Conditions not met for #{spot[:name]}"
      end
    end

    sorted_spots = spot_points.sort_by { |_, points| -points }
    sorted_spots.each do |spot, points|
      puts "#{spot}: #{points} points"
    end
  end
end

surfing_spots = [
  { name: "Bettys Bay", ideal_swell_direction: 190..260, ideal_wave_force: 3..5, ideal_wind_direction: 330..60, adequate_wind_direction: [320..330, 60..70], wind_speed: 0..40, ideal_tide: 1..2, wave_quality: 8 },
  { name: "Pringle Bay", ideal_swell_direction: 190..260, ideal_wave_force: 3..5, ideal_wind_direction: 330..60, adequate_wind_direction: [320..330, 60..70], wind_speed: 0..40, ideal_tide: 1..2, wave_quality: 8 },
  { name: "Cool Bay", ideal_swell_direction: 190..260, ideal_wave_force: 3..5, ideal_wind_direction: 330..60, adequate_wind_direction: [320..330, 60..70], wind_speed: 0..40, ideal_tide: 1..2, wave_quality: 8 },
  { name: "Platboom", ideal_swell_direction: 180..210, ideal_wave_force: 2..5, ideal_wind_direction: 150..180, adequate_wind_direction: [140..150, 180..190], wind_speed: 5..30, ideal_tide: 1..3, wave_quality: 7 },
  { name: "Extensions", ideal_swell_direction: 180..210, ideal_wave_force: 2..5, ideal_wind_direction: 150..180, adequate_wind_direction: [140..150, 180..190], wind_speed: 5..30, ideal_tide: 1..3, wave_quality: 7 },
  { name: "Scarborough", ideal_swell_direction: 180..210, ideal_wave_force: 2..5, ideal_wind_direction: 150..180, adequate_wind_direction: [140..150, 180..190], wind_speed: 5..30, ideal_tide: 1..3, wave_quality: 7 },
  { name: "Misty Cliffs", ideal_swell_direction: 180..210, ideal_wave_force: 2..5, ideal_wind_direction: 150..180, adequate_wind_direction: [140..150, 180..190], wind_speed: 5..30, ideal_tide: 1..3, wave_quality: 7 },
  { name: "Outer Kom", ideal_swell_direction: 180..210, ideal_wave_force: 2..5, ideal_wind_direction: 150..180, adequate_wind_direction: [140..150, 180..190], wind_speed: 5..30, ideal_tide: 1..3, wave_quality: 7 },
  { name: "Inner Kom", ideal_swell_direction: 180..210, ideal_wave_force: 2..5, ideal_wind_direction: 150..180, adequate_wind_direction: [140..150, 180..190], wind_speed: 5..30, ideal_tide: 1..3, wave_quality: 7 },
  { name: "Long Beach", ideal_swell_direction: 180..210, ideal_wave_force: 2..5, ideal_wind_direction: 150..180, adequate_wind_direction: [140..150, 180..190], wind_speed: 5..30, ideal_tide: 1..3, wave_quality: 7 },
  { name: "Dunes", ideal_swell_direction: 180..210, ideal_wave_force: 2..5, ideal_wind_direction: 150..180, adequate_wind_direction: [140..150, 180..190], wind_speed: 5..30, ideal_tide: 1..3, wave_quality: 7 },
  { name: "Hoek", ideal_swell_direction: 180..210, ideal_wave_force: 2..5, ideal_wind_direction: 150..180, adequate_wind_direction: [140..150, 180..190], wind_speed: 5..30, ideal_tide: 1..3, wave_quality: 7 },
  { name: "Sandy Bay", ideal_swell_direction: 180..210, ideal_wave_force: 2..5, ideal_wind_direction: 150..180, adequate_wind_direction: [140..150, 180..190], wind_speed: 5..30, ideal_tide: 1..3, wave_quality: 7 },
  { name: "Llandudno", ideal_swell_direction: 180..210, ideal_wave_force: 2..5, ideal_wind_direction: 150..180, adequate_wind_direction: [140..150, 180..190], wind_speed: 5..30, ideal_tide: 1..3, wave_quality: 7 },
  { name: "Glen Beach", ideal_swell_direction: 180..210, ideal_wave_force: 2..5, ideal_wind_direction: 150..180, adequate_wind_direction: [140..150, 180..190], wind_speed: 5..30, ideal_tide: 1..3, wave_quality: 7 },
  { name: "The Base", ideal_swell_direction: 180..210, ideal_wave_force: 2..5, ideal_wind_direction: 150..180, adequate_wind_direction: [140..150, 180..190], wind_speed: 5..30, ideal_tide: 1..3, wave_quality: 7 },
  { name: "Off The Wall", ideal_swell_direction: 180..210, ideal_wave_force: 2..5, ideal_wind_direction: 150..180, adequate_wind_direction: [140..150, 180..190], wind_speed: 5..30, ideal_tide: 1..3, wave_quality: 7 }
]

current_conditions = {
  swell_direction: 222,
  wave_force: 4,
  wind_direction: 120,
  wind_speed: 20,
  tide: 2
}

selector = SurfSpotSelector.new(surfing_spots, current_conditions)
selector.select_top_spot
