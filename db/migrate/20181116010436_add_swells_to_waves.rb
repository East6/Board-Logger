class AddSwellsToWaves < ActiveRecord::Migration[5.2]
  def change
    add_column :waves, :swellway, :string
  end
end
