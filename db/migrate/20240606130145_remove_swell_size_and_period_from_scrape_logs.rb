class RemoveSwellSizeAndPeriodFromScrapeLogs < ActiveRecord::Migration[7.1]
  def change
    remove_column :scrape_logs, :swell_size, :float
    remove_column :scrape_logs, :swell_period, :integer
  end
end
