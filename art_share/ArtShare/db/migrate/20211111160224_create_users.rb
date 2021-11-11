class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username, null: false, unique: true
      t.timestamps
    end

    create_table :artworks do |t|
      t.string :title, null: false, unique: true
      t.string :image_url, null: false
      t.integer :artist_id, null: false
      t.timestamps
    end

    add_index :artworks, [:artist_id, :title], unique: true
    add_index :artworks, :artist_id

    create_table :artwork_shares do |t|
      t.integer :artwork_id, null: false
      t.integer :viewer_id, null: false
      t.timestamps
    end

    add_index :artwork_shares, :artwork_id
    add_index :artwork_shares, :viewer_id

  end
end
