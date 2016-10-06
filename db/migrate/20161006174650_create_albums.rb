class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :title
      t.boolean :live_album
      t.integer :band_id, null: false

      t.timestamps null: false
    end
  end
end
