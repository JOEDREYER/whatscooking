class AddIdealSwellPeriodToScrapeLogs < ActiveRecord::Migration[7.1]
  def change
    add_column :scrape_logs, :swell_period_min, :integer
    add_column :scrape_logs, :swell_period_max, :integer
  end
end
