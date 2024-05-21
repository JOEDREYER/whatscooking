require 'nokogiri'
require 'open-uri'

class ConditionScraper
  WINDGURU_URL = 'https://www.windguru.cz/91'

  def initialize
    @doc = Nokogiri::HTML(URI.open(WINDGURU_URL))
  end

  def fetch_swell_direction
    swell_data = @doc.css('td.tcell.tcell-c1[data-x] span')
    swell_directions = swell_data.map { |span| span.text.strip }
    swell_directions
  end

  def fetch_wind_direction
    wind_direction_data = @doc.css('td.tcell.tcell-c1 span[title*="("]')
    wind_directions = wind_direction_data.map { |span| span.text.strip }
    wind_directions
  end

  def fetch_swell_size
    swell_size_data = @doc.css('td.tcell.tcell-cl[data-x*="HTSGW"]')
    swell_sizes = swell_size_data.map { |td| td.text.strip.to_f }
    swell_sizes
  end

  def fetch_conditions
    {
      swell_direction: fetch_swell_direction,
      wind_direction: fetch_wind_direction,
      swell_size: fetch_swell_size
      # Add other condition fetching methods here
    }
  end

  # Placeholder methods for other conditions
  def fetch_wave_force
    # Fetch and return wave force
  end

  def fetch_wind_speed
    # Fetch and return wind speed
  end

  def fetch_tide
    # Fetch and return tide
  end
end

scraper = ConditionScraper.new
current_conditions = scraper.fetch_conditions
puts current_conditions
