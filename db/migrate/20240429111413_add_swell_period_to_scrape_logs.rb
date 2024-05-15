class AddSwellPeriodToScrapeLogs < ActiveRecord::Migration[7.1]
  def change
    add_column :scrape_logs, :swell_period, :integer
  end
end
