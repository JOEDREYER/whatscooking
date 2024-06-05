class SpotsController < ApplicationController
  def index
  end


  def show

    date = params[:date]
    @ranked_spots = rank_spots(date, params[:hour])
    # date = params[:date]
    # current_conditions = ScrapeLog.where(scrape_time: date)
    # surfing_spots = Spot.all
    # conditions = ScrapeLog.all
    # top_spots_by_hour = {}

    # current_conditions.group_by { |condition| condition.scrape_time.hour }.each do |hour, conditions|
    #   top_spots = select_top_spot(surfing_spots, conditions.first)
    #   top_spots_by_hour[hour] = top_spots
    # end

    # @top_spots_by_hour = top_spots_by_hour

    # render text: @top_spots_by_hour.inspect

    # @ranked_spots = rank_spots(params[:date], params[:hour])
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

  def rank_spots(date, hour)
    date = params[:date]
    p date
    hour = params[:hour].to_i
    p hour

    # Find all scrape logs for the given date and hour
    scrape_logs = ScrapeLog.where("DATE(scrape_time) = ? AND EXTRACT(HOUR FROM scrape_time) = ?", date, hour)

    @ranked_spots = []

    # Iterate through each scrape log
    scrape_logs.each do |log|
      Spot.all.each do |spot|

        points = 0
        # Evaluate swell direction
        if spot.ideal_swell_direction.include?(log.swell_direction.to_i)
          points += 3
        else
          if spot.lower_swell_direction.include?(log.swell_direction.to_i) || spot.upper_swell_direction.include?(log.swell_direction.to_i)
            points += 1
          end
        end

        # Evaluate wind direction
        if spot.ideal_wind_direction.include?(log.wind_direction.to_i)
          points += 3
        else
          if spot.lower_wind_direction.include?(log.wind_direction.to_i) || spot.upper_wind_direction.include?(log.wind_direction.to_i)
            points += 1
          end
        end

        # Evaluate wave force
        if spot.ideal_wave_force.include?(log.swell_size.to_f)
          points += 3
        end

        # Evaluate tide
        if log.tide.present? && spot.ideal_tide.include?(log.tide.to_f)
          points += 5
        end

        @ranked_spots << { spot: spot, points: points }
      end
    end

    # Sort the spots by points in descending order
    @ranked_spots.sort_by! { |entry| -entry[:points] }

    respond_to do |format|
      format.html
      format.json { render json: @ranked_spots }
    end
  end


  def select_top_spot(surfing_spots, current_conditions)
    spot_points = Hash.new(0)

    surfing_spots = Spot.all

    surfing_spots.each do |spot|
      conditions_met = true

      spot.attributes.each do |condition, range|
        next if condition == :name

        case condition
        when :adequate_wind_direction
          adequate_met = range.any? { |r| within_circular_range?(r, current_conditions[:wind_direction]) }
          conditions_met &&= adequate_met
        when :ideal_wind_direction
          ideal_met = within_circular_range?(range, current_conditions[:wind_direction])
          conditions_met &&= ideal_met
          spot_points[spot[:name]] += 3 if ideal_met
        when :ideal_wave_force
          wave_force_met = range.cover?(current_conditions[:wave_force])
          spot_points[spot[:name]] += 2 if wave_force_met
          conditions_met &&= wave_force_met
        when :wind_speed
          wind_speed_met = range.cover?(current_conditions[:wind_speed])
          spot_points[spot[:name]] += 1 if wind_speed_met
          conditions_met &&= wind_speed_met
        when :ideal_swell_direction
          swell_direction_met = range.cover?(current_conditions[:swell_direction])
          spot_points[spot[:name]] += 3 if swell_direction_met
          conditions_met &&= swell_direction_met
        when :ideal_tide
          tide_met = range.cover?(current_conditions[:tide])
          spot_points[spot[:name]] += 5 if tide_met
          conditions_met &&= tide_met
        else
          if range.is_a?(Range)
            condition_met = range.cover?(current_conditions[condition])
          else
            condition_met = range == current_conditions[condition]
          end
          conditions_met &&= condition_met
        end
      end
    end

    def within_circular_range?(range, degree)
      return true if range.include?(degree)

      start, finish = range.first, range.last
      if start > finish
        (0..finish).include?(degree) || (start..360).include?(degree)
      else
        false
      end
    end


    sorted_spots = spot_points.sort_by { |_, points| -points }
    top_5_spots = sorted_spots.first(5)

    top_5_spots.each do |spot, points|
      spot_data = surfing_spots.find { |s| s[:name] == spot }
      spot_points[spot] += spot_data[:wave_quality] if spot_data
    end

    final_sorted_spots = spot_points.sort_by { |_, points| -points }
    final_sorted_spots.map { |spot, points| "#{spot}: #{points} points" }
  end

  def destroy
  end
end
