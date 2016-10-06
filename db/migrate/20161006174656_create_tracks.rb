class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :title, null: false
      t.text :lyrics
      t.boolean :bonus_track
      t.integer :album_id, null: false

      t.timestamps null: false
    end
  end
end
