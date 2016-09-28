class AddUserIdToOwns < ActiveRecord::Migration
  def change
    add_column :owns, :user_id, :integer
  end
end
