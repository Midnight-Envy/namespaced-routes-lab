class CreatePreferences < ActiveRecord::Migration[7.1]
  def change
    create_table :preferences do |t|
      t.boolean :allow_create_songs
      t.boolean :allow_create_artists

      t.timestamps
    end
  end
end
