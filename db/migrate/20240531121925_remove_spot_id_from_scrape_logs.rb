class RemoveSpotIdFromScrapeLogs < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :scrape_logs, :spots
    remove_column :scrape_logs, :spot_id, :bigint
  end
end
