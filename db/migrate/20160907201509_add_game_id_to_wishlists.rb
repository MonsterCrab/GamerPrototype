class AddGameIdToWishlists < ActiveRecord::Migration
  def change
  	add_column :wishlists, :game_id, :integer
  end
end
