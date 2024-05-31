require 'stormglass_api'

every 12.hours do
  ScrapeglassApi.new.pull_data
end
