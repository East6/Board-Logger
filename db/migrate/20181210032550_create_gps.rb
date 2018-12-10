class CreateGps < ActiveRecord::Migration[5.2]
  def change
    create_table :gps do |t|
      t.float :latitude
      t.float :longitude
      t.integer :board_id

      t.timestamps
    end
  end
end
