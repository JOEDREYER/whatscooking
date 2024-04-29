class CreateSpots < ActiveRecord::Migration[7.1]
  def change
    create_table :spots do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.float :swell_size
      t.string :wind_direction
      t.string :swell_direction
      t.string :tide

      t.timestamps
    end
  end
end
