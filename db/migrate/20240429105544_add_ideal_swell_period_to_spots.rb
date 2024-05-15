class AddIdealSwellPeriodToSpots < ActiveRecord::Migration[7.1]
  def change
    add_column :spots, :swell_period_min, :integer
    add_column :spots, :swell_period_max, :integer
  end
end
