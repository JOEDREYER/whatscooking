class CreateSurfingLevels < ActiveRecord::Migration[7.1]
  def change
    create_table :surfing_levels do |t|
      t.string :name

      t.timestamps
    end
  end
end
