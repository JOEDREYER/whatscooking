class UpdateSpotsTable < ActiveRecord::Migration[7.1]
  def change
    change_table :spots do |t|
      t.string :spot_name
      t.integer :ideal_swell_direction
      t.integer :lower_swell_direction
      t.integer :upper_swell_direction
      t.integer :ideal_wave_force
      t.integer :ideal_wind_direction
      t.integer :lower_wind_direction
      t.integer :upper_wind_direction
      t.string :ideal_tide
      t.integer :wave_quality

      t.remove :name
      t.remove :swell_size
      t.remove :wind_direction
      t.remove :swell_direction
      t.remove :tide
      t.remove :swell_period
    end
  end
end
