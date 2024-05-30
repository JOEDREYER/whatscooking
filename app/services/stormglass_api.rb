require 'httparty'
require 'dotenv/load'
require 'time'
require 'uri'
require 'json'
# Get first hour of today
start_time = Time.now.utc
end_time = Time.now.utc + 5 * 24 * 60 * 60 # adding 5 days in seconds




response = HTTParty.get(
  'https://api.stormglass.io/v2/weather/point',
  query: {
    lat: -33.9221,
    lng: 18.4231,
    params: ['waveHeight', 'wavePeriod', 'windDirection', 'windSpeed', 'swellDirection'].join(','),
    start: start_time.to_i,  # Convert to UTC timestamp
    end: end_time.to_i  # Convert to UTC timestamp
  },
  headers: {
    'Authorization' => ENV['STORMGLASS_API_KEY']
  }
)

# Do something with response data.
json_data = JSON.parse(response.body)

# Group data by day
grouped_data = {}


json_data['hours'].each do |hour_data|
  date = Time.parse(hour_data['time']).utc.to_date.to_s
  grouped_data[date] ||= []
  grouped_data[date] << {
    time: Time.parse(hour_data['time']).utc,
    waveHeight: hour_data.dig('waveHeight', 'noaa'),
    wavePeriod: hour_data.dig('wavePeriod', 'noaa'),
    windDirection: hour_data.dig('windDirection', 'icon'),
    windSpeed: hour_data.dig('windSpeed', 'icon'),
    swellDirection: hour_data.dig('swellDirection', 'noaa')
  }
end

# Print grouped data
grouped_data.each do |date, data|
  puts "Date: #{date}"
  data.each do |entry|
    puts "  Time: #{entry[:time]}"
    puts "  Wave Height: #{entry[:waveHeight]}"
    puts "  Wave Period: #{entry[:wavePeriod]}"
    puts "  Wind Direction: #{entry[:windDirection]}"
    puts "  Wind Speed: #{entry[:windSpeed]}"
    puts "  Swell Direction: #{entry[:swellDirection]}"
    puts "---"
  end
end
