class RemoveSwellPeriodFromScrapeLogs < ActiveRecord::Migration[7.1]
  def change
    remove_column :scrape_logs, :swell_period_min
    remove_column :scrape_logs, :swell_period_max
  end
end
