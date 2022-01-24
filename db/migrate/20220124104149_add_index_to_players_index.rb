class AddIndexToPlayersIndex < ActiveRecord::Migration[7.0]
  def change
    add_index :players, :index, unique: true
  end
end
