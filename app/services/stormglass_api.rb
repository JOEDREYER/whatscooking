require 'httparty'
require 'dotenv/load'
require 'time'
require 'uri'
require 'json'

class StormglassApi


  def calculate_wave_force(swell_size, swell_period)
    wave_force = swell_size

    if swell_period > 20
      wave_force += 2
    elsif swell_period > 17
      wave_force += 1.5
    elsif swell_period > 15
      wave_force += 1
    elsif swell_period > 13
      wave_force += 0.5
    end

    wave_force
  end




  def pull_data
    # API pulling logic for weather and tide data
    start_time = Time.now.utc
    end_time = start_time + 2 * 24 * 60 * 60 # adding 2 days in seconds

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

    p
    # Parse the responses and extract the data
    weather_json = JSON.parse(weather_response.body)

    tide_json = JSON.parse(tide_response.body)


    daily_min_max = {}




    p weather_json
    data["data"].each do |point|
      time = point["time"]
      sg = point["sg"]
      day = time.split("T")[0]  # extract the date part (YYYY-MM-DD)
      time_of_day = time.split("T")[1]  # extract the time part (HH:MM:SSZ)

      if daily_min_max[day]
        if sg < daily_min_max[day][:min][:value]
          daily_min_max[day][:min] = { value: sg, time: time_of_day }
        end
        if sg > daily_min_max[day][:max][:value]
          daily_min_max[day][:max] = { value: sg, time: time_of_day }
        end
      else
        daily_min_max[day] = {
          min: { value: sg, time: time_of_day },
          max: { value: sg, time: time_of_day }
        }
      end
    end

    puts JSON.pretty_generate(daily_min_max)



    # puts "Weather Response Code: #{weather_response.code}"
    # puts "Weather Response Body: #{weather_response.body}"

    # Create a hash to match tide data with weather data based on time
    # if tide_json && tide_json['data'] && tide_json['data'].any?
    #   tide_data_by_time = tide_json['data'].each_with_object({}) do |hour_data, hash|
    #     time = Time.parse(hour_data['time']).utc
    #     hash[time] = hour_data['sg']
    #   end
    # else
    #   puts "Error: No tide data available"
    # end

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
        swell_size = entry[:wave_height]
        swell_period = entry[:wave_period]

        wave_force = calculate_wave_force(swell_size, swell_period)

        ScrapeLog.create!(
          scrape_time: entry[:time],
          wind_direction: entry[:wind_direction],
          swell_direction: entry[:swell_direction],
          tide: tide_value,
          wave_force: wave_force  # Add wave_force to the attributes being created
        )
      end
    end
  end
end
stormglass = StormglassApi.new
stormglass.pull_data

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
