class UpdateSpotsTable2 < ActiveRecord::Migration[6.1]
  def change
    change_column :spots, :ideal_swell_direction, :string
    change_column :spots, :lower_swell_direction, :string
    change_column :spots, :upper_swell_direction, :string
    change_column :spots, :ideal_wave_force, :string
    change_column :spots, :ideal_wind_direction, :string
    change_column :spots, :lower_wind_direction, :string
    change_column :spots, :upper_wind_direction, :string
  end
end
