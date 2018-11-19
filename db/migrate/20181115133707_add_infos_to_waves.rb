class AddInfosToWaves < ActiveRecord::Migration[5.2]
  def change
    add_column :waves, :windpower, :string
    add_column :waves, :windway, :string
    add_column :waves, :shore, :string
    add_column :waves, :swell, :string
  end
end
