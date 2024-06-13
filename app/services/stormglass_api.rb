require 'httparty'
require 'dotenv/load'
require 'time'
require 'json'
require 'date'

class StormglassApi
  def calculate_wave_force(swell_size, swell_period)
    wave_force = swell_size

    case swell_period
    when 20..Float::INFINITY
      wave_force += 2
    when 17..20
      wave_force += 1.5
    when 15..17
      wave_force += 1
    when 13..15
      wave_force += 0.5
    end

    wave_force
  end

  def pull_data
    # start_time = Time.now.utc
    # end_time = start_time + 2 * 24 * 60 * 60

    # weather_response = HTTParty.get(
    #   'https://api.stormglass.io/v2/weather/point',
    #   query: {
    #     lat: -33.9221,
    #     lng: 18.4231,
    #     params: ['waveHeight', 'wavePeriod', 'windDirection', 'windSpeed', 'swellDirection'].join(','),
    #     start: start_time.to_i,
    #     end: end_time.to_i
    #   },
    #   headers: {
    #     'Authorization' => ENV['STORMGLASS_API_KEY']
    #   }
    # )

    # tide_response = HTTParty.get(
    #   'https://api.stormglass.io/v2/tide/sea-level/point',
    #   query: {
    #     lat: -33.9221,
    #     lng: 18.4231,
    #     start: start_time.to_i,
    #     end: end_time.to_i
    #   },
    #   headers: {
    #     'Authorization' => ENV['STORMGLASS_API_KEY']
    #   }
    # )

    # weather_data = JSON.parse(weather_response.body)
    # tide_data = JSON.parse(tide_response.body)

    # wind directon use ICON
    # Swell Direction = NOA
    # Swell Size = NOA
    # 

    weather_data = {
      "hours": [
          {
              "seaLevel": {
                  "meto": -0.23,
                  "sg": -0.23
              },
              "swellDirection": {
                  "meteo": 235.7,
                  "noaa": 244.49,
                  "sg": 235.7
              },
              "swellPeriod": {
                  "meteo": 8.02,
                  "noaa": 10.76,
                  "sg": 8.02
              },
              "time": "2024-06-13T00:00:00+00:00",
              "waveHeight": {
                  "meteo": 2.46,
                  "noaa": 2.26,
                  "sg": 2.46
              },
              "wavePeriod": {
                  "meteo": 7.82,
                  "noaa": 10.76,
                  "sg": 7.82
              },
              "windDirection": {
                  "noaa": 111.96,
                  "sg": 111.96
              },
              "windSpeed": {
                  "noaa": 0.29,
                  "sg": 0.29
              }
          },
          {
              "seaLevel": {
                  "meto": -0.23,
                  "sg": -0.23
              },
              "swellDirection": {
                  "meteo": 235.47,
                  "noaa": 244.15,
                  "sg": 235.47
              },
              "swellPeriod": {
                  "meteo": 8.0,
                  "noaa": 10.71,
                  "sg": 8.0
              },
              "time": "2024-06-13T01:00:00+00:00",
              "waveHeight": {
                  "meteo": 2.41,
                  "noaa": 2.23,
                  "sg": 2.41
              },
              "wavePeriod": {
                  "meteo": 7.82,
                  "noaa": 10.71,
                  "sg": 7.82
              },
              "windDirection": {
                  "noaa": 111.63,
                  "sg": 111.63
              },
              "windSpeed": {
                  "noaa": 0.45,
                  "sg": 0.45
              }
          },
          {
              "seaLevel": {
                  "meto": -0.24,
                  "sg": -0.24
              },
              "swellDirection": {
                  "meteo": 235.24,
                  "noaa": 243.81,
                  "sg": 235.24
              },
              "swellPeriod": {
                  "meteo": 7.99,
                  "noaa": 10.65,
                  "sg": 7.99
              },
              "time": "2024-06-13T02:00:00+00:00",
              "waveHeight": {
                  "meteo": 2.36,
                  "noaa": 2.19,
                  "sg": 2.36
              },
              "wavePeriod": {
                  "meteo": 7.82,
                  "noaa": 10.65,
                  "sg": 7.82
              },
              "windDirection": {
                  "noaa": 111.3,
                  "sg": 111.3
              },
              "windSpeed": {
                  "noaa": 0.62,
                  "sg": 0.62
              }
          },
          {
              "seaLevel": {
                  "meto": -0.24,
                  "sg": -0.24
              },
              "swellDirection": {
                  "meteo": 235.01,
                  "noaa": 243.47,
                  "sg": 235.01
              },
              "swellPeriod": {
                  "meteo": 7.97,
                  "noaa": 10.6,
                  "sg": 7.97
              },
              "time": "2024-06-13T03:00:00+00:00",
              "waveHeight": {
                  "meteo": 2.31,
                  "noaa": 2.16,
                  "sg": 2.31
              },
              "wavePeriod": {
                  "meteo": 7.82,
                  "noaa": 10.6,
                  "sg": 7.82
              },
              "windDirection": {
                  "noaa": 110.97,
                  "sg": 110.97
              },
              "windSpeed": {
                  "noaa": 0.78,
                  "sg": 0.78
              }
          },
          {
              "seaLevel": {
                  "meto": -0.24,
                  "sg": -0.24
              },
              "swellDirection": {
                  "meteo": 238.62,
                  "noaa": 243.2,
                  "sg": 238.62
              },
              "swellPeriod": {
                  "meteo": 7.91,
                  "noaa": 10.57,
                  "sg": 7.91
              },
              "time": "2024-06-13T04:00:00+00:00",
              "waveHeight": {
                  "meteo": 2.27,
                  "noaa": 2.12,
                  "sg": 2.27
              },
              "wavePeriod": {
                  "meteo": 7.83,
                  "noaa": 10.57,
                  "sg": 7.83
              },
              "windDirection": {
                  "noaa": 114.84,
                  "sg": 114.84
              },
              "windSpeed": {
                  "noaa": 0.89,
                  "sg": 0.89
              }
          },
          {
              "seaLevel": {
                  "meto": -0.24,
                  "sg": -0.24
              },
              "swellDirection": {
                  "meteo": 242.23,
                  "noaa": 242.93,
                  "sg": 242.23
              },
              "swellPeriod": {
                  "meteo": 7.84,
                  "noaa": 10.55,
                  "sg": 7.84
              },
              "time": "2024-06-13T05:00:00+00:00",
              "waveHeight": {
                  "meteo": 2.22,
                  "noaa": 2.07,
                  "sg": 2.22
              },
              "wavePeriod": {
                  "meteo": 7.83,
                  "noaa": 10.55,
                  "sg": 7.83
              },
              "windDirection": {
                  "noaa": 118.7,
                  "sg": 118.7
              },
              "windSpeed": {
                  "noaa": 1.01,
                  "sg": 1.01
              }
          },
          {
              "seaLevel": {
                  "meto": -0.24,
                  "sg": -0.24
              },
              "swellDirection": {
                  "meteo": 245.84,
                  "noaa": 242.66,
                  "sg": 245.84
              },
              "swellPeriod": {
                  "meteo": 7.78,
                  "noaa": 10.52,
                  "sg": 7.78
              },
              "time": "2024-06-13T06:00:00+00:00",
              "waveHeight": {
                  "meteo": 2.18,
                  "noaa": 2.03,
                  "sg": 2.18
              },
              "wavePeriod": {
                  "meteo": 7.84,
                  "noaa": 10.52,
                  "sg": 7.84
              },
              "windDirection": {
                  "noaa": 122.57,
                  "sg": 122.57
              },
              "windSpeed": {
                  "noaa": 1.12,
                  "sg": 1.12
              }
          },
          {
              "seaLevel": {
                  "meto": -0.24,
                  "sg": -0.24
              },
              "swellDirection": {
                  "meteo": 233.24,
                  "noaa": 242.58,
                  "sg": 233.24
              },
              "swellPeriod": {
                  "meteo": 7.81,
                  "noaa": 10.52,
                  "sg": 7.81
              },
              "time": "2024-06-13T07:00:00+00:00",
              "waveHeight": {
                  "meteo": 2.14,
                  "noaa": 1.99,
                  "sg": 2.14
              },
              "wavePeriod": {
                  "meteo": 7.84,
                  "noaa": 10.52,
                  "sg": 7.84
              },
              "windDirection": {
                  "noaa": 131.78,
                  "sg": 131.78
              },
              "windSpeed": {
                  "noaa": 1.17,
                  "sg": 1.17
              }
          },
          {
              "seaLevel": {
                  "meto": -0.25,
                  "sg": -0.25
              },
              "swellDirection": {
                  "meteo": 220.63,
                  "noaa": 242.51,
                  "sg": 220.63
              },
              "swellPeriod": {
                  "meteo": 7.84,
                  "noaa": 10.53,
                  "sg": 7.84
              },
              "time": "2024-06-13T08:00:00+00:00",
              "waveHeight": {
                  "meteo": 2.11,
                  "noaa": 1.94,
                  "sg": 2.11
              },
              "wavePeriod": {
                  "meteo": 7.84,
                  "noaa": 10.53,
                  "sg": 7.84
              },
              "windDirection": {
                  "noaa": 140.99,
                  "sg": 140.99
              },
              "windSpeed": {
                  "noaa": 1.21,
                  "sg": 1.21
              }
          },
          {
              "seaLevel": {
                  "meto": -0.25,
                  "sg": -0.25
              },
              "swellDirection": {
                  "meteo": 208.03,
                  "noaa": 242.43,
                  "sg": 208.03
              },
              "swellPeriod": {
                  "meteo": 7.87,
                  "noaa": 10.53,
                  "sg": 7.87
              },
              "time": "2024-06-13T09:00:00+00:00",
              "waveHeight": {
                  "meteo": 2.07,
                  "noaa": 1.9,
                  "sg": 2.07
              },
              "wavePeriod": {
                  "meteo": 7.84,
                  "noaa": 10.53,
                  "sg": 7.84
              },
              "windDirection": {
                  "noaa": 150.2,
                  "sg": 150.2
              },
              "windSpeed": {
                  "noaa": 1.26,
                  "sg": 1.26
              }
          },
          {
              "seaLevel": {
                  "meto": -0.25,
                  "sg": -0.25
              },
              "swellDirection": {
                  "meteo": 207.94,
                  "noaa": 242.33,
                  "sg": 207.94
              },
              "swellPeriod": {
                  "meteo": 7.86,
                  "noaa": 10.52,
                  "sg": 7.86
              },
              "time": "2024-06-13T10:00:00+00:00",
              "waveHeight": {
                  "meteo": 2.04,
                  "noaa": 1.86,
                  "sg": 2.04
              },
              "wavePeriod": {
                  "meteo": 7.86,
                  "noaa": 10.52,
                  "sg": 7.86
              },
              "windDirection": {
                  "noaa": 162.0,
                  "sg": 162.0
              },
              "windSpeed": {
                  "noaa": 1.47,
                  "sg": 1.47
              }
          },
          {
              "seaLevel": {
                  "meto": -0.25,
                  "sg": -0.25
              },
              "swellDirection": {
                  "meteo": 207.84,
                  "noaa": 242.24,
                  "sg": 207.84
              },
              "swellPeriod": {
                  "meteo": 7.85,
                  "noaa": 10.5,
                  "sg": 7.85
              },
              "time": "2024-06-13T11:00:00+00:00",
              "waveHeight": {
                  "meteo": 2.02,
                  "noaa": 1.83,
                  "sg": 2.02
              },
              "wavePeriod": {
                  "meteo": 7.88,
                  "noaa": 10.5,
                  "sg": 7.88
              },
              "windDirection": {
                  "noaa": 173.81,
                  "sg": 173.81
              },
              "windSpeed": {
                  "noaa": 1.68,
                  "sg": 1.68
              }
          },
          {
              "seaLevel": {
                  "meto": -0.26,
                  "sg": -0.26
              },
              "swellDirection": {
                  "meteo": 207.75,
                  "noaa": 242.14,
                  "sg": 207.75
              },
              "swellPeriod": {
                  "meteo": 7.84,
                  "noaa": 10.49,
                  "sg": 7.84
              },
              "time": "2024-06-13T12:00:00+00:00",
              "waveHeight": {
                  "meteo": 1.99,
                  "noaa": 1.79,
                  "sg": 1.99
              },
              "wavePeriod": {
                  "meteo": 7.9,
                  "noaa": 10.49,
                  "sg": 7.9
              },
              "windDirection": {
                  "noaa": 185.61,
                  "sg": 185.61
              },
              "windSpeed": {
                  "noaa": 1.89,
                  "sg": 1.89
              }
          },
          {
              "seaLevel": {
                  "meto": -0.26,
                  "sg": -0.26
              },
              "swellDirection": {
                  "meteo": 207.79,
                  "noaa": 241.81,
                  "sg": 207.79
              },
              "swellPeriod": {
                  "meteo": 7.82,
                  "noaa": 10.44,
                  "sg": 7.82
              },
              "time": "2024-06-13T13:00:00+00:00",
              "waveHeight": {
                  "meteo": 1.99,
                  "noaa": 1.79,
                  "sg": 1.99
              },
              "wavePeriod": {
                  "meteo": 7.89,
                  "noaa": 10.44,
                  "sg": 7.89
              },
              "windDirection": {
                  "noaa": 176.86,
                  "sg": 176.86
              },
              "windSpeed": {
                  "noaa": 2.05,
                  "sg": 2.05
              }
          },
          {
              "seaLevel": {
                  "meto": -0.26,
                  "sg": -0.26
              },
              "swellDirection": {
                  "meteo": 207.82,
                  "noaa": 241.47,
                  "sg": 207.82
              },
              "swellPeriod": {
                  "meteo": 7.81,
                  "noaa": 10.39,
                  "sg": 7.81
              },
              "time": "2024-06-13T14:00:00+00:00",
              "waveHeight": {
                  "meteo": 2.0,
                  "noaa": 1.78,
                  "sg": 2.0
              },
              "wavePeriod": {
                  "meteo": 7.88,
                  "noaa": 10.39,
                  "sg": 7.88
              },
              "windDirection": {
                  "noaa": 168.1,
                  "sg": 168.1
              },
              "windSpeed": {
                  "noaa": 2.22,
                  "sg": 2.22
              }
          },
          {
              "seaLevel": {
                  "meto": -0.26,
                  "sg": -0.26
              },
              "swellDirection": {
                  "meteo": 207.86,
                  "noaa": 241.14,
                  "sg": 207.86
              },
              "swellPeriod": {
                  "meteo": 7.79,
                  "noaa": 10.34,
                  "sg": 7.79
              },
              "time": "2024-06-13T15:00:00+00:00",
              "waveHeight": {
                  "meteo": 2.0,
                  "noaa": 1.78,
                  "sg": 2.0
              },
              "wavePeriod": {
                  "meteo": 7.87,
                  "noaa": 10.34,
                  "sg": 7.87
              },
              "windDirection": {
                  "noaa": 159.35,
                  "sg": 159.35
              },
              "windSpeed": {
                  "noaa": 2.38,
                  "sg": 2.38
              }
          },
          {
              "seaLevel": {
                  "meto": -0.26,
                  "sg": -0.26
              },
              "swellDirection": {
                  "meteo": 226.61,
                  "noaa": 240.71,
                  "sg": 226.61
              },
              "swellPeriod": {
                  "meteo": 7.74,
                  "noaa": 10.3,
                  "sg": 7.74
              },
              "time": "2024-06-13T16:00:00+00:00",
              "waveHeight": {
                  "meteo": 2.05,
                  "noaa": 1.84,
                  "sg": 2.05
              },
              "wavePeriod": {
                  "meteo": 7.87,
                  "noaa": 12.34,
                  "sg": 7.87
              },
              "windDirection": {
                  "noaa": 159.33,
                  "sg": 159.33
              },
              "windSpeed": {
                  "noaa": 2.24,
                  "sg": 2.24
              }
          },
          {
              "seaLevel": {
                  "meto": -0.26,
                  "sg": -0.26
              },
              "swellDirection": {
                  "meteo": 245.36,
                  "noaa": 240.27,
                  "sg": 245.36
              },
              "swellPeriod": {
                  "meteo": 7.69,
                  "noaa": 10.27,
                  "sg": 7.69
              },
              "time": "2024-06-13T17:00:00+00:00",
              "waveHeight": {
                  "meteo": 2.11,
                  "noaa": 1.91,
                  "sg": 2.11
              },
              "wavePeriod": {
                  "meteo": 7.88,
                  "noaa": 14.35,
                  "sg": 7.88
              },
              "windDirection": {
                  "noaa": 159.3,
                  "sg": 159.3
              },
              "windSpeed": {
                  "noaa": 2.11,
                  "sg": 2.11
              }
          },
          {
              "seaLevel": {
                  "meto": -0.27,
                  "sg": -0.27
              },
              "swellDirection": {
                  "meteo": 264.11,
                  "noaa": 239.84,
                  "sg": 264.11
              },
              "swellPeriod": {
                  "meteo": 7.64,
                  "noaa": 10.23,
                  "sg": 7.64
              },
              "time": "2024-06-13T18:00:00+00:00",
              "waveHeight": {
                  "meteo": 2.16,
                  "noaa": 1.97,
                  "sg": 2.16
              },
              "wavePeriod": {
                  "meteo": 7.88,
                  "noaa": 16.35,
                  "sg": 7.88
              },
              "windDirection": {
                  "noaa": 159.28,
                  "sg": 159.28
              },
              "windSpeed": {
                  "noaa": 1.97,
                  "sg": 1.97
              }
          },
          {
              "seaLevel": {
                  "meto": -0.27,
                  "sg": -0.27
              },
              "swellDirection": {
                  "meteo": 252.36,
                  "noaa": 238.07,
                  "sg": 252.36
              },
              "swellPeriod": {
                  "meteo": 8.3,
                  "noaa": 11.98,
                  "sg": 8.3
              },
              "time": "2024-06-13T19:00:00+00:00",
              "waveHeight": {
                  "meteo": 2.25,
                  "noaa": 2.1,
                  "sg": 2.25
              },
              "wavePeriod": {
                  "meteo": 8.14,
                  "noaa": 16.06,
                  "sg": 8.14
              },
              "windDirection": {
                  "noaa": 164.52,
                  "sg": 164.52
              },
              "windSpeed": {
                  "noaa": 1.91,
                  "sg": 1.91
              }
          },
          {
              "seaLevel": {
                  "meto": -0.27,
                  "sg": -0.27
              },
              "swellDirection": {
                  "meteo": 240.6,
                  "noaa": 236.31,
                  "sg": 240.6
              },
              "swellPeriod": {
                  "meteo": 8.97,
                  "noaa": 13.74,
                  "sg": 8.97
              },
              "time": "2024-06-13T20:00:00+00:00",
              "waveHeight": {
                  "meteo": 2.33,
                  "noaa": 2.24,
                  "sg": 2.33
              },
              "wavePeriod": {
                  "meteo": 8.39,
                  "noaa": 15.78,
                  "sg": 8.39
              },
              "windDirection": {
                  "noaa": 169.77,
                  "sg": 169.77
              },
              "windSpeed": {
                  "noaa": 1.84,
                  "sg": 1.84
              }
          },
          {
              "seaLevel": {
                  "meto": -0.27,
                  "sg": -0.27
              },
              "swellDirection": {
                  "meteo": 228.85,
                  "noaa": 234.54,
                  "sg": 228.85
              },
              "swellPeriod": {
                  "meteo": 9.63,
                  "noaa": 15.49,
                  "sg": 9.63
              },
              "time": "2024-06-13T21:00:00+00:00",
              "waveHeight": {
                  "meteo": 2.42,
                  "noaa": 2.37,
                  "sg": 2.42
              },
              "wavePeriod": {
                  "meteo": 8.65,
                  "noaa": 15.49,
                  "sg": 8.65
              },
              "windDirection": {
                  "noaa": 175.01,
                  "sg": 175.01
              },
              "windSpeed": {
                  "noaa": 1.78,
                  "sg": 1.78
              }
          },
          {
              "seaLevel": {
                  "meto": -0.27,
                  "sg": -0.27
              },
              "swellDirection": {
                  "meteo": 225.3,
                  "noaa": 235.58,
                  "sg": 225.3
              },
              "swellPeriod": {
                  "meteo": 9.84,
                  "noaa": 15.34,
                  "sg": 9.84
              },
              "time": "2024-06-13T22:00:00+00:00",
              "waveHeight": {
                  "meteo": 2.52,
                  "noaa": 2.49,
                  "sg": 2.52
              },
              "wavePeriod": {
                  "meteo": 8.93,
                  "noaa": 15.34,
                  "sg": 8.93
              },
              "windDirection": {
                  "noaa": 169.13,
                  "sg": 169.13
              },
              "windSpeed": {
                  "noaa": 1.51,
                  "sg": 1.51
              }
          },
          {
              "seaLevel": {
                  "meto": -0.27,
                  "sg": -0.27
              },
              "swellDirection": {
                  "meteo": 221.75,
                  "noaa": 236.61,
                  "sg": 221.75
              },
              "swellPeriod": {
                  "meteo": 10.05,
                  "noaa": 15.19,
                  "sg": 10.05
              },
              "time": "2024-06-13T23:00:00+00:00",
              "waveHeight": {
                  "meteo": 2.61,
                  "noaa": 2.62,
                  "sg": 2.61
              },
              "wavePeriod": {
                  "meteo": 9.21,
                  "noaa": 15.19,
                  "sg": 9.21
              },
              "windDirection": {
                  "noaa": 163.26,
                  "sg": 163.26
              },
              "windSpeed": {
                  "noaa": 1.24,
                  "sg": 1.24
              }
          },
          {
              "seaLevel": {
                  "meto": -0.27,
                  "sg": -0.27
              },
              "swellDirection": {
                  "meteo": 218.2,
                  "noaa": 237.65,
                  "sg": 218.2
              },
              "swellPeriod": {
                  "meteo": 10.26,
                  "noaa": 15.04,
                  "sg": 10.26
              },
              "time": "2024-06-14T00:00:00+00:00",
              "waveHeight": {
                  "meteo": 2.71,
                  "noaa": 2.74,
                  "sg": 2.71
              },
              "wavePeriod": {
                  "meteo": 9.49,
                  "noaa": 15.04,
                  "sg": 9.49
              },
              "windDirection": {
                  "noaa": 157.38,
                  "sg": 157.38
              },
              "windSpeed": {
                  "noaa": 0.97,
                  "sg": 0.97
              }
          }
      ],
      "meta": {
          "cost": 1,
          "dailyQuota": 10,
          "end": "2024-06-14 00:00",
          "lat": -33.9249,
          "lng": 18.4241,
          "params": [
              "waveHeight",
              "wavePeriod",
              "swellPeriod",
              "seaLevel",
              "windSpeed",
              "windDirection",
              "swellDirection"
          ],
          "requestCount": 9,
          "start": "2024-06-13 00:00"
      }
  }

    tide_data = {
      "data": [
          {
              "sg": -0.3,
              "time": "2024-06-13T00:00:00+00:00"
          },
          {
              "sg": -0.28,
              "time": "2024-06-13T01:00:00+00:00"
          },
          {
              "sg": -0.19,
              "time": "2024-06-13T02:00:00+00:00"
          },
          {
              "sg": -0.06,
              "time": "2024-06-13T03:00:00+00:00"
          },
          {
              "sg": 0.07,
              "time": "2024-06-13T04:00:00+00:00"
          },
          {
              "sg": 0.17,
              "time": "2024-06-13T05:00:00+00:00"
          },
          {
              "sg": 0.22,
              "time": "2024-06-13T06:00:00+00:00"
          },
          {
              "sg": 0.19,
              "time": "2024-06-13T07:00:00+00:00"
          },
          {
              "sg": 0.1,
              "time": "2024-06-13T08:00:00+00:00"
          },
          {
              "sg": -0.04,
              "time": "2024-06-13T09:00:00+00:00"
          },
          {
              "sg": -0.18,
              "time": "2024-06-13T10:00:00+00:00"
          },
          {
              "sg": -0.28,
              "time": "2024-06-13T11:00:00+00:00"
          },
          {
              "sg": -0.32,
              "time": "2024-06-13T12:00:00+00:00"
          },
          {
              "sg": -0.29,
              "time": "2024-06-13T13:00:00+00:00"
          },
          {
              "sg": -0.2,
              "time": "2024-06-13T14:00:00+00:00"
          },
          {
              "sg": -0.05,
              "time": "2024-06-13T15:00:00+00:00"
          },
          {
              "sg": 0.1,
              "time": "2024-06-13T16:00:00+00:00"
          },
          {
              "sg": 0.24,
              "time": "2024-06-13T17:00:00+00:00"
          },
          {
              "sg": 0.32,
              "time": "2024-06-13T18:00:00+00:00"
          },
          {
              "sg": 0.33,
              "time": "2024-06-13T19:00:00+00:00"
          },
          {
              "sg": 0.27,
              "time": "2024-06-13T20:00:00+00:00"
          },
          {
              "sg": 0.15,
              "time": "2024-06-13T21:00:00+00:00"
          },
          {
              "sg": 0.01,
              "time": "2024-06-13T22:00:00+00:00"
          },
          {
              "sg": -0.13,
              "time": "2024-06-13T23:00:00+00:00"
          },
          {
              "sg": -0.23,
              "time": "2024-06-14T00:00:00+00:00"
          }
      ],
      "meta": {
          "cost": 1,
          "dailyQuota": 10,
          "datum": "MSL",
          "end": "2024-06-14 00:00",
          "lat": -33.9221,
          "lng": 18.4231,
          "requestCount": 7,
          "start": "2024-06-13 00:00",
          "station": {
              "distance": 3,
              "lat": -33.9,
              "lng": 18.433,
              "name": "cape town",
              "source": "uhslc"
          }
      }
  }

  weather_data = JSON.parse(weather_data)
  tide_data = JSON.parse(tide_data)

  p weather_data
  p tide_data

    tide_data_by_time = {}
    tolerance_seconds = 1800  # 30 minutes tolerance

    tide_data['data'].each do |point|
      time = Time.parse(point['time']).utc
      tide_data_by_time[time] = point['sg']
    end

    grouped_weather_data = {}
    weather_data['hours'].each do |hour_data|
      time = Time.parse(hour_data['time']).utc
      date = time.to_date.to_s
      grouped_weather_data[date] ||= []

      wave_height = hour_data.dig('waveHeight', 'noaa')
      wave_period = hour_data.dig('wavePeriod', 'noaa')
      wind_direction = hour_data.dig('windDirection', 'icon')
      wind_speed = hour_data.dig('windSpeed', 'icon')
      swell_direction = hour_data.dig('swellDirection', 'noaa')

      next unless wave_height && wave_period && wind_direction && wind_speed && swell_direction

      closest_tide_time, tide_value = tide_data_by_time.min_by { |tide_time, _| (tide_time - time).abs }

      if (time - closest_tide_time).abs <= tolerance_seconds
        wave_force = calculate_wave_force(wave_height, wave_period)

        ScrapeLog.create!(
          scrape_time: time,
          wind_direction: wind_direction,
          swell_direction: swell_direction,
          tide: tide_value,
          wave_force: wave_force
        )
      end

      grouped_weather_data[date] << {
        time: time,
        wave_height: wave_height,
        wave_period: wave_period,
        wind_direction: wind_direction,
        wind_speed: wind_speed,
        swell_direction: swell_direction
      }
    end

    grouped_weather_data.each do |date, data|
      puts "Date: #{date}"
      data.each do |entry|
        puts "  Time: #{entry[:time]}"
        puts "  Wave Height: #{entry[:wave_height]}"
        puts "  Wave Period: #{entry[:wave_period]}"
        puts "  Wind Direction: #{entry[:wind_direction]}"
        puts "  Wind Speed: #{entry[:wind_speed]}"
        puts "  Swell Direction: #{entry[:swell_direction]}"
        puts "---"
      end
    end
  end
end

stormglass = StormglassApi.new
stormglass.pull_data
