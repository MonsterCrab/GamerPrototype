class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title
      t.string :subtitle
      t.text :description
      t.string :tag
      t.string :platform
      t.float :score
      t.text :urltitle
      t.text :urlurl
      t.date :release_date

      t.timestamps null: false
    end
  end
end
