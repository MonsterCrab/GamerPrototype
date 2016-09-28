class CreateOwns < ActiveRecord::Migration
  def change
    create_table :owns do |t|

      t.timestamps null: false
    end
  end
end
