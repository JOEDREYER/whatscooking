class AddSurfingLevelToUsers < ActiveRecord::Migration[7.1]
  def change
    add_reference :users, :surfing_level, null: false, foreign_key: true
  end
end
