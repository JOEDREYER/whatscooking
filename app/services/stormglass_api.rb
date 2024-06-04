# require 'httparty'
# require 'dotenv/load'
# require 'time'
# require 'uri'
# require 'json'
# # Get first hour of today
# class StormglassApi

#   def pull_tide_data
#     # API pulling logic for tide data
#     response = HTTParty.get('https://api.stormglass.io/v2/tide/sea-level/point',
#       query: {
#         lat: -33.9221,
#         lng: 18.4231,
#         params: ['waterLevel'],
#         start: Time.now.utc.to_i,
#         end: Time.now.utc.to_i + 5 * 24 * 60 * 60 # 5 days
#       },
#       headers: { 'Authorization' => ENV['STORMGLASS_API_KEY'] }
#     )

#     # Parse the response and extract the tide data
#     json_data = JSON.parse(response.body)
#     tide_data = json_data['hours'].map do |hour_data|
#       {
#         time: Time.parse(hour_data['time']).utc,
#         water_level: hour_data['waterLevel']
#       }
#     end

#     # Create ScrapeLog records for the tide data
#     tide_data.each do |entry|
#       ScrapeLog.create!(
#         scrape_time: entry[:time],
#         tide: entry[:water_level]
#       )
#     end
#   end

#   def pull_data
#     # Your API pulling logic here
#     start_time = Time.now.utc
#     end_time = Time.now.utc + 5 * 24 * 60 * 60 # adding 5 days in seconds
#     response = HTTParty.get(
#       'https://api.stormglass.io/v2/weather/point',
#       query: {
#         lat: -33.9221,
#         lng: 18.4231,
#         params: ['waveHeight', 'wavePeriod', 'windDirection', 'windSpeed', 'swellDirection'].join(','),
#         start: start_time.to_i,  # Convert to UTC timestamp
#         end: end_time.to_i  # Convert to UTC timestamp
#       },
#       headers: {
#         'Authorization' => ENV['STORMGLASS_API_KEY']
#       }
#     )

#     # Do something with response data.
#     json_data = JSON.parse(response.body)

#     # Group data by day
#     grouped_data = {}


#     json_data['hours'].each do |hour_data|
#       date = Time.parse(hour_data['time']).utc.to_date.to_s
#       grouped_data[date] ||= []
#       grouped_data[date] << {
#         time: Time.parse(hour_data['time']).utc,
#         waveHeight: hour_data.dig('waveHeight', 'noaa'),
#         wavePeriod: hour_data.dig('wavePeriod', 'noaa'),
#         windDirection: hour_data.dig('windDirection', 'icon'),
#         windSpeed: hour_data.dig('windSpeed', 'icon'),
#         swellDirection: hour_data.dig('swellDirection', 'noaa')
#       }
#     end

#     grouped_data.each do |date, data|
#       data.each do |entry|
#         ScrapeLog.create!(
#           scrape_time: entry[:time],
#           swell_size: entry[:waveHeight],
#           wind_direction: entry[:windDirection],
#           swell_direction: entry[:swellDirection],
#           tide: nil, # Replace with the actual tide value
#           swell_period: entry[:wavePeriod]
#           # tide: tide_data[index]
#         )
#       end
#     end

#   end
# end

# # pull_data
# # # Print grouped data
# # grouped_data.each do |date, data|
# #   puts "Date: #{date}"
# #   data.each do |entry|
# #     puts "  Time: #{entry[:time]}"
# #     puts "  Wave Height: #{entry[:waveHeight]}"
# #     puts "  Wave Period: #{entry[:wavePeriod]}"
# #     puts "  Wind Direction: #{entry[:windDirection]}"
# #     puts "  Wind Speed: #{entry[:windSpeed]}"
# #     puts "  Swell Direction: #{entry[:swellDirection]}"
# #     puts "---"
# #   end
# # end


require 'httparty'
require 'dotenv/load'
require 'time'
require 'uri'
require 'json'

class StormglassApi
  def pull_data
    # API pulling logic for weather and tide data
    start_time = Time.now.utc
    end_time = start_time + 5 * 24 * 60 * 60 # adding 5 days in seconds

    # Weather data API call
    weather_response = HTTParty.get(
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

    # Tide data API call
    tide_response = HTTParty.get('https://api.stormglass.io/v2/tide/sea-level/point',
      query: {
        lat: -33.9221,
        lng: 18.4231,
        params: ['waterLevel'],
        start: start_time.to_i,
        end: end_time.to_i
      },
      headers: { 'Authorization' => ENV['STORMGLASS_API_KEY'] }
    )


    # Parse the responses and extract the data
    weather_json = JSON.parse(weather_response.body)
    p weather
    tide_json = JSON.parse(tide_response.body)
    p tide_json
    if tide_response.success?
      tide_json = JSON.parse(tide_response.body)
    else
      puts "Error: #{tide_response.code} - #{tide_response.message}"
      return
    end
    # Create a hash to match tide data with weather data based on time
    tide_data_by_time = tide_json['hours'].each_with_object({}) do |hour_data, hash|
      time = Time.parse(hour_data['time']).utc
      hash[time] = hour_data['waterLevel']
    end

    # Group weather data by day
    grouped_weather_data = {}
    weather_json['hours'].each do |hour_data|
      date = Time.parse(hour_data['time']).utc.to_date.to_s
      grouped_weather_data[date] ||= []
      grouped_weather_data[date] << {
        time: Time.parse(hour_data['time']).utc,
        wave_height: hour_data.dig('waveHeight', 'noaa'),
        wave_period: hour_data.dig('wavePeriod', 'noaa'),
        wind_direction: hour_data.dig('windDirection', 'icon'),
        wind_speed: hour_data.dig('windSpeed', 'icon'),
        swell_direction: hour_data.dig('swellDirection', 'noaa')
      }
    end

    # Update ScrapeLog records with tide data
    grouped_weather_data.each do |date, data|
      data.each do |entry|
        tide_value = tide_data_by_time[entry[:time]]
        ScrapeLog.create!(
          scrape_time: entry[:time],
          swell_size: entry[:wave_height],
          wind_direction: entry[:wind_direction],
          swell_direction: entry[:swell_direction],
          tide: tide_value,
          swell_period: entry[:wave_period]
        )
      end
    end
  end
end

p "hello world"
