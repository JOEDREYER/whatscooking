# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb

spots = [
  {
    name: "Bettys Bay",
    swell_direction: 190..260,
    swell_size: 3..5,
    wind_direction: 330..60,
    adequate_wind_direction: [320..330, 60..70],
    wind_speed: 0..40,
    tide: 1..2,
    wave_quality: 8
  },
  {
    name: "Pringle Bay",
    swell_direction: 210..270,
    swell_size: 4..6,
    wind_direction: 100..160,
    adequate_wind_direction: [90..100, 160..170],
    wind_speed: 0..35,
    tide: 1..2,
    wave_quality: 6
  },
  {
    name: "Cool Bay",
    swell_direction: 190..270,
    swell_size: 1.5..2.5,
    wind_direction: 70..130,
    adequate_wind_direction: [60..70, 130..140],
    wind_speed: 0..25,
    tide: 1..2,
    wave_quality: 6
  },
  {
    name: "Gordons Bay",
    swell_direction: 190..235,
    swell_size: 4..7,
    wind_direction: 70..130,
    adequate_wind_direction: [60..70, 130..140],
    tide: 3..5,
    wave_quality: 6.5
  },
  {
    name: "Strand",
    swell_direction: 190..235,
    swell_size: 2..6,
    wind_direction: 70..130,
    adequate_wind_direction: [60..70, 130..140],
    tide: 3..5,
    wave_quality: 6
  },
  {
    name: "Muizenberg",
    swell_direction: 190..225,
    swell_size: 2..6,
    wind_direction: 280..30,
    adequate_wind_direction: [270..280, 30..40],
    tide: 3..5,
    wave_quality: 6
  },
  {
    name: "Dangers",
    swell_direction: 170..210,
    swell_size: 2.5..6,
    wind_direction: 280..31,
    adequate_wind_direction: [270..280, 31..41],
    tide: 3..5,
    wave_quality: 7
  },
  {
    name: "Kalk Bay Reef",
    swell_direction: 170..210,
    swell_size: 2..6,
    wind_direction: 280..32,
    adequate_wind_direction: [270..280, 32..42],
    tide: 3..5,
    wave_quality: 8
  },
  {
    name: "Black Rocks",
    swell_direction: 170..210,
    swell_size: 3..6,
    wind_direction: 280..33,
    adequate_wind_direction: [270..280, 33..43],
    tide: 3..5,
    wave_quality: 8
  },
  {
    name: "Dias Beach",
    swell_direction: 190..225,
    swell_size: 1..2,
    wind_direction: 280..34,
    adequate_wind_direction: [270..280, 34..44],
    tide: 1..2,
    wave_quality: 5
  },
  {
    name: "Platboom",
    swell_direction: 205..270,
    swell_size: 2.5..4.5,
    wind_direction: 280..35,
    adequate_wind_direction: [270..280, 35..45],
    tide: 3..5,
    wave_quality: 8
  },
  {
    name: "Extensions",
    swell_direction: 220..270,
    swell_size: 2.5..4.5,
    wind_direction: 90..146,
    adequate_wind_direction: [80..90, 146..156],
    tide: 3..5,
    wave_quality: 7.5
  },
  {
    name: "Scarborough",
    swell_direction: 205..270,
    swell_size: 2.5..4.5,
    wind_direction: 90..146,
    adequate_wind_direction: [80..90, 146..156],
    tide: 3..5,
    wave_quality: 6.5
  },
  {
    name: "Misty Cliffs",
    swell_direction: 205..270,
    swell_size: 2.5..4.5,
    wind_direction: 0..85,
    adequate_wind_direction: [350..0, 85..95],
    tide: 3..5,
    wave_quality: 5
  },
  {
    name: "Outer Kom",
    swell_direction: 205..270,
    swell_size: 2.5..4.5,
    wind_direction: 90..146,
    adequate_wind_direction: [80..90, 146..156],
    tide: 3..5,
    wave_quality: 7
  },
  {
    name: "Inner Kom",
    swell_direction: 205..270,
    swell_size: 2.5..4.5,
    wind_direction: 90..146,
    adequate_wind_direction: [80..90, 146..156],
    tide: 3..5,
    wave_quality: 5
  },
  {
    name: "Long Beach",
    swell_direction: 205..270,
    swell_size: 2.5..5,
    wind_direction: 90..146,
    adequate_wind_direction: [80..90, 146..156],
    tide: 1..2,
    wave_quality: 7
  },
  {
    name: "Dunes",
    swell_direction: 215..270,
    swell_size: 2.5..4.5,
    wind_direction: 90..146,
    adequate_wind_direction: [80..90, 146..156],
    tide: 1..2,
    wave_quality: 9
  },
  {
    name: "Hoek",
    swell_direction: 215..270,
    swell_size: 2-3.5,
    wind_direction: 90..146,
    adequate_wind_direction: [80..90, 146..156],
    tide: 1..2,
    wave_quality: 8
  },
  {
    name: "Sandy Bay",
    swell_direction: 215..270,
    swell_size: 3..4.5,
    wind_direction: 90..146,
    adequate_wind_direction: [80..90, 146..156],
    tide: 1..2,
    wave_quality: 8
  },
  {
    name: "Llandudno",
    swell_direction: 215..270,
    swell_size: 1.8..3,
    wind_direction: 90..146,
    adequate_wind_direction: [80..90, 146..156],
    tide: 1..2,
    wave_quality: 7
  },
  {
    name: "Glen Beach",
    swell_direction: 200..270,
    swell_size: 2..3,
    wind_direction: 90..146,
    adequate_wind_direction: [80..90, 146..156],
    tide: 1..3,
    wave_quality: 5.5
  },
  {
    name: "Queens Beach",
    swell_direction: 215..270,
    swell_size: 1.5..2.5,
    wind_direction: 90..146,
    adequate_wind_direction: [80..90, 146..156],
    tide: 3..5,
    wave_quality: 4.5
  },
  {
    name: "Sollys",
    swell_direction: 215..270,
    swell_size: 1.5..2.5,
    wind_direction: 90..146,
    adequate_wind_direction: [80..90, 146..156],
    tide: 3..5,
    wave_quality: 4
  },
  {
    name: "Off the Wall",
    swell_direction: 215..270,
    swell_size: 2..4,
    wind_direction: 90..146,
    adequate_wind_direction: [80..90, 146..156],
    tide: 3..5,
    wave_quality: 7
  },
  {
    name: "Thermos",
    swell_direction: 200..270,
    swell_size: 2..4,
    wind_direction: 90..146,
    adequate_wind_direction: [80..90, 146..156],
    tide: 3..5,
    wave_quality: 6
  },
  {
    name: "Granger Bay",
    swell_direction: 200..270,
    swell_size: 1..3,
    wind_direction: 90..146,
    adequate_wind_direction: [80..90, 146..156],
    tide: 3..5,
    wave_quality: 3
  },
  {
    name: "Milnerton",
    swell_direction: 200..270,
    swell_size: 2..4,
    wind_direction: 90..146,
    adequate_wind_direction: [80..90, 146..156],
    tide: 3..5,
    wave_quality: 5
  },
  {
    name: "Table View",
    swell_direction: 190..260,
    swell_size: 3..6,
    wind_direction: 120..180,
    adequate_wind_direction: [110..120, 180..190],
    tide: 1..3,
    wave_quality: 8
  },
  {
    name: "Big Bay",
    swell_direction: 190..270,
    swell_size: 2.5..4.5,
    wind_direction: 90..146,
    adequate_wind_direction: [80..90, 146..156],
    tide: 1..2,
    wave_quality: 7
  },
  {
    name: "Haakgat",
    swell_direction: 200..270,
    swell_size: 3.5..5.5,
    wind_direction: 90..146,
    adequate_wind_direction: [80..90, 146..156],
    tide: 1..2,
    wave_quality: 8
  },
  {
    name: "Derdesteen",
    swell_direction: 200..270,
    swell_size: 3..5,
    wind_direction: 90..146,
    adequate_wind_direction: [80..90, 146..156],
    tide: 1..2,
    wave_quality: 7.5
  },
  {
    name: "Silwerstroom",
    swell_direction: 200..270,
    swell_size: 3..5,
    wind_direction: 90..146,
    adequate_wind_direction: [80..90, 146..156],
    tide: 1..2,
    wave_quality: 6.5
  },
  {
    name: "Yzerfontein",
    swell_direction: 200..270,
    swell_size: 2.5..4.5,
    wind_direction: 90..146,
    adequate_wind_direction: [80..90, 146..156],
    tide: 1..2,
    wave_quality: 7
  },
  {
    name: "Paternoster",
    swell_direction: 200..270,
    swell_size: 3..6,
    wind_direction: 90..146,
    adequate_wind_direction: [80..90, 146..156],
    tide: 1..2,
    wave_quality: 8
  },
  {
    name: "Elands Bay",
    swell_direction: 190..270,
    swell_size: 2..4,
    wind_direction: 60..120,
    adequate_wind_direction: [50..60, 120..130],
    tide: 1..2,
    wave_quality: 8
  }
]

spots.each do |spot|
  Spot.new(
    name: spot[:name],
    swell_direction: spot[:swell_direction],
    swell_size: spot[:swell_size],
    wind_direction: spot[:wind_direction],
    adequate_wind_direction: spot[:adequate_wind_direction],
    wind_speed: spot[:wind_speed],
    tide: spot[:tide],
    wave_quality: spot[:wave_quality]
  )
end
