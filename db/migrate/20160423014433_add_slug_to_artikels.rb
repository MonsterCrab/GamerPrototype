class AddSlugToArtikels < ActiveRecord::Migration
  def change
    add_column :artikels, :slug, :string
  end
end
