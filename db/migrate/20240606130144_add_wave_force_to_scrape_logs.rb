class AddWaveForceToScrapeLogs < ActiveRecord::Migration[7.1]
  def change
    add_column :scrape_logs, :wave_force, :float
  end
end
