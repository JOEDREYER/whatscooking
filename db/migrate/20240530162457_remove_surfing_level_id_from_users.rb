class RemoveSurfingLevelIdFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :surfing_level_id, :bigint
  end
end
