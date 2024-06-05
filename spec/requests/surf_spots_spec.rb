require 'rails_helper'

RSpec.describe "SurfSpots", type: :request do
  describe "GET /rank_spots" do
    before do
      # Create some surf spots
      @spot1 = Spot.create(
        spot_name: "Queens Beach",
        latitude: -33.9561,
        longitude: 18.356,
        ideal_swell_direction: "215..270",
        lower_swell_direction: "210..215",
        upper_swell_direction: "270..275",
        ideal_wave_force: "1.5..2.5",
        ideal_wind_direction: "90..146",
        lower_wind_direction: "80..98",
        upper_wind_direction: "146..163",
        ideal_tide: "0.9..1.9",
        wave_quality: 4
      )

      @spot2 = Spot.create(
        spot_name: "Sollys",
        latitude: -33.9543,
        longitude: 18.3661,
        ideal_swell_direction: "215..270",
        lower_swell_direction: "210..215",
        upper_swell_direction: "270..275",
        ideal_wave_force: "1.5..2.5",
        ideal_wind_direction: "90..146",
        lower_wind_direction: "80..99",
        upper_wind_direction: "146..164",
        ideal_tide: "0.9..1.9",
        wave_quality: 4
      )

      # Create some scrape logs
      @scrape_log1 = ScrapeLog.create(
        scrape_time: "2024-05-31 15:00:00",
        swell_size: 3.02,
        wind_direction: "225.32",
        swell_direction: "215.72",
        tide: nil,
        swell_period: 13
      )

      @scrape_log2 = ScrapeLog.create(
        scrape_time: "2024-05-31 16:00:00",
        swell_size: 2.99,
        wind_direction: "205.39",
        swell_direction: "217.12",
        tide: nil,
        swell_period: 13
      )
    end

    it "returns ranked surf spots based on conditions" do
      get rank_spots_surf_spots_path, params: { date: '2024-05-31', hour: 15 }

      expect(response).to have_http_status(:success)

      ranked_spots = JSON.parse(response.body)

      expect(ranked_spots).to be_an_instance_of(Array)
      expect(ranked_spots.first['spot']['spot_name']).to eq(@spot1.spot_name)
      expect(ranked_spots.first['points']).to be >= 0
    end
  end
end

# ✗ bundle exec rspec
