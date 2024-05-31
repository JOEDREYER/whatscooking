require 'httparty'
require 'dotenv/load'
require 'time'
require 'uri'
require 'json'
# Get first hour of today
class StormglassApi

  def pull_tide_data
    # API pulling logic for tide data
    response = HTTParty.get('(link unavailable)',
      query: {
        lat: -33.9221,
        lng: 18.4231,
        params: ['waterLevel'],
        start: Time.now.utc.to_i,
        end: Time.now.utc.to_i + 5 * 24 * 60 * 60 # 5 days
      },
      headers: { 'Authorization' => ENV['STORMGLASS_API_KEY'] }
    )

    # Parse the response and extract the tide data
    json_data = JSON.parse(response.body)
    tide_data = json_data['hours'].map do |hour_data|
      {
        time: Time.parse(hour_data['time']).utc,
        water_level: hour_data['waterLevel']
      }
    end

    # Create ScrapeLog records for the tide data
    tide_data.each do |entry|
      ScrapeLog.create!(
        scrape_time: entry[:time],
        tide: entry[:water_level]
      )
    end
  end
  
  def pull_data
    # Your API pulling logic here
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

    grouped_data.each do |date, data|
      data.each do |entry|
        ScrapeLog.create!(
          scrape_time: entry[:time],
          swell_size: entry[:waveHeight],
          wind_direction: entry[:windDirection],
          swell_direction: entry[:swellDirection],
          tide: nil, # Replace with the actual tide value
          swell_period: entry[:wavePeriod]
        )
      end
    end
  end
end
# # Print grouped data
# grouped_data.each do |date, data|
#   puts "Date: #{date}"
#   data.each do |entry|
#     puts "  Time: #{entry[:time]}"
#     puts "  Wave Height: #{entry[:waveHeight]}"
#     puts "  Wave Period: #{entry[:wavePeriod]}"
#     puts "  Wind Direction: #{entry[:windDirection]}"
#     puts "  Wind Speed: #{entry[:windSpeed]}"
#     puts "  Swell Direction: #{entry[:swellDirection]}"
#     puts "---"
#   end
# end
