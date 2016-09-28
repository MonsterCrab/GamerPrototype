class CreateArtikels < ActiveRecord::Migration
  def change
    create_table :artikels do |t|
      t.string :title
      t.string :subtitle
      t.text :description
      t.string :tag
      t.string :platform

      t.timestamps null: false
    end
  end
end
