class RemoveSurfingLevelsTable < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :users, :surfing_levels
    drop_table :surfing_levels, cascade: true
  end
end
