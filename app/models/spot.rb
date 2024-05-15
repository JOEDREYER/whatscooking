# app/models/spot.rb
class Spot < ApplicationRecord
  def self.calculate_top_spot(current_conditions)
    surfing_spots = [
      {
        name: "Bettys Bay",
        ideal_swell_direction: 190..260,
        ideal_wave_force: "3.5",
        ideal_wind_direction: 330..60,
        adequate_wind_direction: [320..330, 60..70],
        wind_speed: 0..40,
        ideal_tide: 1..2,
        wave_quality: 8
      },
      {
        name: "Pringle Bay",
        ideal_swell_direction: 210..270,
        ideal_wave_force: "4-6",
        ideal_wind_direction: 100..160,
        adequate_wind_direction: [90..100, 160..170],
        wind_speed: 0..35,
        ideal_tide: 1..2,
        wave_quality: 6
      },
      {
        name: "Cool Bay",
        ideal_swell_direction: 190..270,
        ideal_wave_force: "1.5-2.5",
        ideal_wind_direction: 70..130,
        adequate_wind_direction: [60..70, 130..140],
        wind_speed: 0..25,
        ideal_tide: 1..2,
        wave_quality: 6
      },
      {
        name: "Gordons Bay",
        ideal_swell_direction: 190..235,
        ideal_wave_force: "4-7",
        ideal_wind_direction: 70..130,
        adequate_wind_direction: [60..70, 130..140],
        ideal_tide: 3..5,
        wave_quality: 6.5
      },
      {
        name: "Strand",
        ideal_swell_direction: 190..235,
        ideal_wave_force: 2..6,
        ideal_wind_direction: 70..130,
        adequate_wind_direction: [60..70, 130..140],
        ideal_tide: 3..5,
        wave_quality: 6
      },
      {
        name: "Muizenberg",
        ideal_swell_direction: 190..225,
        ideal_wave_force: 2..6,
        ideal_wind_direction: 280..30,
        adequate_wind_direction: [270..280, 30..40],
        ideal_tide: 3..5,
        wave_quality: 6
      },
      {
        name: "Dangers",
        ideal_swell_direction: 170..210,
        ideal_wave_force: 2.5..6,
        ideal_wind_direction: 280..31,
        adequate_wind_direction: [270..280, 31..41],
        ideal_tide: 3..5,
        wave_quality: 7
      },
      {
        name: "Kalk Bay Reef",
        ideal_swell_direction: 170..210,
        ideal_wave_force: 2..6,
        ideal_wind_direction: 280..32,
        adequate_wind_direction: [270..280, 32..42],
        ideal_tide: 3..5,
        wave_quality: 8
      },
      {
        name: "Black Rocks",
        ideal_swell_direction: 170..210,
        ideal_wave_force: 3..6,
        ideal_wind_direction: 280..33,
        adequate_wind_direction: [270..280, 33..43],
        ideal_tide: 3..5,
        wave_quality: 8
      },
      {
        name: "Dias Beach",
        ideal_swell_direction: 190..225,
        ideal_wave_force: "1-2",
        ideal_wind_direction: 280..34,
        adequate_wind_direction: [270..280, 34..44],
        ideal_tide: 1..2,
        wave_quality: 5
      },
      {
        name: "Platboom",
        ideal_swell_direction: 205..270,
        ideal_wave_force: "2.5-4.5",
        ideal_wind_direction: 280..35,
        adequate_wind_direction: [270..280, 35..45],
        ideal_tide: 3..5,
        wave_quality: 8
      },
      {
        name: "Extensions",
        ideal_swell_direction: 220..270,
        ideal_wave_force: "2.5-4.5",
        ideal_wind_direction: 90..146,
        adequate_wind_direction: [80..90, 146..156],
        ideal_tide: 3..5,
        wave_quality: 7.5
      },
      {
        name: "Scarborough",
        ideal_swell_direction: 205..270,
        ideal_wave_force: "2.5-4.5",
        ideal_wind_direction: 90..146,
        adequate_wind_direction: [80..90, 146..156],
        ideal_tide: 3..5,
        wave_quality: 6.5
      },
      {
        name: "Misty Cliffs",
        ideal_swell_direction: 205..270,
        ideal_wave_force: "2.5-4.5",
        ideal_wind_direction: 0..85,
        adequate_wind_direction: [350..0, 85..95],
        ideal_tide: 3..5,
        wave_quality: 5
      },
      {
        name: "Outer Kom",
        ideal_swell_direction: 205..270,
        ideal_wave_force: "2.5-4.5",
        ideal_wind_direction: 90..146,
        adequate_wind_direction: [80..90, 146..156],
        ideal_tide: 3..5,
        wave_quality: 7
      },
      {
        name: "Inner Kom",
        ideal_swell_direction: 205..270,
        ideal_wave_force: "2.5-4.5",
        ideal_wind_direction: 90..146,
        adequate_wind_direction: [80..90, 146..156],
        ideal_tide: 3..5,
        wave_quality: 5
      },
      {
        name: "Long Beach",
        ideal_swell_direction: 205..270,
        ideal_wave_force: "2.5-5",
        ideal_wind_direction: 90..146,
        adequate_wind_direction: [80..90, 146..156],
        ideal_tide: 1..2,
        wave_quality: 7
      },
      {
        name: "Dunes",
        ideal_swell_direction: 215..270,
        ideal_wave_force: "2.5-4.5",
        ideal_wind_direction: 90..146,
        adequate_wind_direction: [80..90, 146..156],
        ideal_tide: 1..2,
        wave_quality: 9
      },
      {
        name: "Hoek",
        ideal_swell_direction: 215..270,
        ideal_wave_force: "2-3.5",
        ideal_wind_direction: 90..146,
        adequate_wind_direction: [80..90, 146..156],
        ideal_tide: 1..2,
        wave_quality: 8
      },
      {
        name: "Sandy Bay",
        ideal_swell_direction: 215..270,
        ideal_wave_force: "3-4.5",
        ideal_wind_direction: 90..146,
        adequate_wind_direction: [80..90, 146..156],
        ideal_tide: 1..2,
        wave_quality: 8
      },
      {
        name: "Llandudno",
        ideal_swell_direction: 215..270,
        ideal_wave_force: "1.8-3",
        ideal_wind_direction: 90..146,
        adequate_wind_direction: [80..90, 146..156],
        ideal_tide: 1..2,
        wave_quality: 7
      },
      {
        name: "Glen Beach",
        ideal_swell_direction: 200..270,
        ideal_wave_force: "2-3",
        ideal_wind_direction: 90..146,
        adequate_wind_direction: [80..90, 146..156],
        ideal_tide: 1..3,
        wave_quality: 5.5
      },
      {
        name: "Queens Beach",
        ideal_swell_direction: 215..270,
        ideal_wave_force: "1.5-2.5",
        ideal_wind_direction: 90..146,
        adequate_wind_direction: [80..90, 146..156],
        ideal_tide: 3..5,
        wave_quality: 4.5
      },
      {
        name: "Sollys",
        ideal_swell_direction: 215..270,
        ideal_wave_force: "1.5-2.5",
        ideal_wind_direction: 90..146,
        adequate_wind_direction: [80..90, 146..156],
        ideal_tide: 3..5,
        wave_quality: 4
      },
      {
        name: "Off the Wall",
        ideal_swell_direction: 215..270,
        ideal_wave_force: "2-4",
        ideal_wind_direction: 90..146,
        adequate_wind_direction: [80..90, 146..156],
        ideal_tide: 3..5,
        wave_quality: 7
      },
      {
        name: "Thermos",
        ideal_swell_direction: 215..270,
        ideal_wave_force: "3-5",
        ideal_wind_direction: 90..146,
        adequate_wind_direction: [80..90, 146..156],
        ideal_tide: 3..5,
        wave_quality: 8
      },
      {
        name: "Derdesteen",
        ideal_swell_direction: 215..270,
        ideal_wave_force: "2-4",
        ideal_wind_direction: 0..100,
        adequate_wind_direction: [350..0, 100..110],
        ideal_tide: 3..5,
        wave_quality: 8
      },
      {
        name: "Elands Bay",
        ideal_swell_direction: 215..270,
        ideal_wave_force: "2-5",
        ideal_wind_direction: 90..146,
        adequate_wind_direction: [80..90, 146..156],
        ideal_tide: 3..5,
        wave_quality: 9
      }

      # Add more spots with their ideal conditions here
    ]


    spot_points = Hash.new(0)

    surfing_spots.each do |spot|
      conditions_met = true

      spot[:ideal_conditions].each do |condition, range|
        conditions_met &&= range.cover?(current_conditions[condition])
      end

      if conditions_met
        spot_points[spot[:name]] += spot[:points]
      end
    end

    top_spot = spot_points.max_by { |spot, points| points }
    return top_spot
  end
end
