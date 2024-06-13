class SpotsController < ApplicationController
  def index
  end

  def show
    date = params[:date].to_date
    @ranked_spots = rank_spots(date)
    flash[:debug] = @debug_info
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  private

  def destroy
  end

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

  def rank_spots(date)
    times_to_check = [6, 9, 12, 15, 18] # Specific times to check
    ranked_spots = []
    @debug_info = []  # Initialize @debug_info as an empty array
    times_to_check.each do |hour|
      scrape_logs = ScrapeLog.where("DATE(scrape_time) = ? AND EXTRACT(HOUR FROM scrape_time) = ?", date, hour)

      @debug_info << "Scrape logs for #{hour}: #{scrape_logs.inspect}"

      scrape_logs.each do |log|
        Spot.limit(8).each do |spot|
        # Spot.all.each do |spot|
          points = 0
        #    @debug_info << "Evaluating spot: #{spot.spot_name}"
         @debug_info << "Ideal swell direction: #{spot.ideal_swell_direction}"
          # Evaluate swell direction
          if spot.ideal_swell_direction.include?(log.swell_direction.to_i)
            points += 3
          elsif spot.lower_swell_direction.include?(log.swell_direction.to_i) || spot.upper_swell_direction.include?(log.swell_direction.to_i)
            points += 1
          end

          # Evaluate wind direction
          if spot.ideal_wind_direction.include?(log.wind_direction.to_i)
            points += 3
          elsif spot.lower_wind_direction.include?(log.wind_direction.to_i) || spot.upper_wind_direction.include?(log.wind_direction.to_i)
            points += 1
          end

          # Evaluate wave force
          if spot.ideal_wave_force.include?(log.wave_force.to_f)
            points += 3
          end

          # Evaluate tide
          if log.tide.present? && spot.ideal_tide.include?(log.tide.to_f)
            points += 5
          end

          ranked_spots << { spot: spot, points: points }
        end
      end
    end

    ranked_spots.sort_by { |entry| -entry[:points] }
  end
end



# class SpotsController < ApplicationController
#   def index
#   end


#   def show

#     date = params[:date].to_date
#     p date
#     @ranked_spots = rank_spots(date)

#     # date = params[:date]
#     # current_conditions = ScrapeLog.where(scrape_time: date)
#     # surfing_spots = Spot.all
#     # conditions = ScrapeLog.all
#     # top_spots_by_hour = {}

#     # current_conditions.group_by { |condition| condition.scrape_time.hour }.each do |hour, conditions|
#     #   top_spots = select_top_spot(surfing_spots, conditions.first)
#     #   top_spots_by_hour[hour] = top_spots
#     # end

#     # @top_spots_by_hour = top_spots_by_hour

#     # render text: @top_spots_by_hour.inspect

#     # @ranked_spots = rank_spots(params[:date], params[:hour])
#   end

#   def new
#   end

#   def create
#   end

#   def edit
#   end

#   def update
#   end

#   private



#   def destroy
#   end

#   def calculate_wave_force(swell_size, swell_period)
#     wave_force = swell_size

#     if swell_period > 20
#       wave_force += 2
#     elsif swell_period > 17
#       wave_force += 1.5
#     elsif swell_period > 15
#       wave_force += 1
#     elsif swell_period > 13
#       wave_force += 0.5
#     end

#     wave_force
#   end


#   date = "2024-05-31".to_date
#   ranked_spots = rank_spots(date)
#   puts ranked_spots





#     # seems this one is working quite well here

#   def rank_spots(date)
#     # date = params[:date].to_date
#     times_to_check = [6, 9, 12, 15, 18] # Specific times to check


#     @ranked_spots = []
#     # Iterate through each time
#     times_to_check.each do |hour|
#       # Find all scrape logs for the given date and time
#       scrape_logs = ScrapeLog.where("DATE(scrape_time) = ? AND EXTRACT(HOUR FROM scrape_time) = ?", date, hour)

#       # Iterate through each scrape log
#       scrape_logs.each do |log|
#         # Iterate through each surf spot
#         Spot.all.each do |spot|
#           points = 0

#           # Evaluate swell direction
#           if spot.ideal_swell_direction.include?(log.swell_direction.to_i)
#             points += 3
#           else
#             if spot.lower_swell_direction.include?(log.swell_direction.to_i) || spot.upper_swell_direction.include?(log.swell_direction.to_i)
#               points += 1
#             end
#           end

#           # Evaluate wind direction
#           if spot.ideal_wind_direction.include?(log.wind_direction.to_i)
#             points += 3
#           else
#             if spot.lower_wind_direction.include?(log.wind_direction.to_i) || spot.upper_wind_direction.include?(log.wind_direction.to_i)
#               points += 1
#             end
#           end

#           # Evaluate wave force
#           if spot.ideal_wave_force.include?(log.swell_size.to_f)
#             points += 3
#           end

#           # Evaluate tide
#           if log.tide.present? && spot.ideal_tide.include?(log.tide.to_f)
#             points += 5
#           end

#           @ranked_spots << { spot: spot, points: points }
#         end
#       end
#     end
#   end
# end
