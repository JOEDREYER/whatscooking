class SurfConditionsController < ApplicationController
  def update_swell_direction
    scraper = SwellScraper.new
    @swell_directions = scraper.fetch_swell_direction

    # Assuming you want to store this in the current conditions
    @current_conditions = { swell_direction: @swell_directions }

    # Render or redirect as needed
    render json: @current_conditions
  end
end
