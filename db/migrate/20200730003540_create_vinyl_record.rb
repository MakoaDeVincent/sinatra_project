class CreateVinylRecord < ActiveRecord::Migration
  def change
    create_table :vinyl_records do |t|
      t.string :artist
      t.string :album
      t.string :genre
      t.integer :year
      t.integer :user_id
    end
  end
end
