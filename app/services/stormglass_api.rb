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
    lat: 58.7984,
    lng: 17.8081,
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

puts json_data
