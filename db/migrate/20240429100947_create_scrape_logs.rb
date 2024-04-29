class CreateScrapeLogs < ActiveRecord::Migration[7.1]
  def change
    create_table :scrape_logs do |t|
      t.references :spot, null: false, foreign_key: true
      t.datetime :scrape_time
      t.float :swell_size
      t.string :wind_direction
      t.string :swell_direction
      t.string :tide

      t.timestamps
    end
  end
end
