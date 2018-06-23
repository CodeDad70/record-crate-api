class CreateArtists < ActiveRecord::Migration[5.1]
  def change
    create_table :artists do |t|
        t.string :name
        t.integer :album_id
        t.string :profile_url
        
      t.timestamps
    end
  end
end
