class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.integer :album_id, null: false
      t.text :name, null: false
      t.text :lyrics
      t.string :category

      t.timestamps null: false
    end

    add_index :tracks, [:album_id, :name]
  end
end
