class AddGameIdToOwns < ActiveRecord::Migration
  def change
    add_column :owns, :game_id, :integer
  end
end
