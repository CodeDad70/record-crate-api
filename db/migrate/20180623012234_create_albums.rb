class CreateAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|
        t.string :name
        t.integer :artist_id
        t.string :image_url
        t.decimal :price, :precision => 8, :scale => 2
      t.timestamps
    end
  end
end
