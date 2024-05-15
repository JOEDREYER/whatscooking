class AddSwellPeriodToSpots < ActiveRecord::Migration[7.1]
  def change
    add_column :spots, :swell_period, :integer
  end
end
