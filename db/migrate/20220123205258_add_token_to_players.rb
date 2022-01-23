class AddTokenToPlayers < ActiveRecord::Migration[7.0]
  def change
    add_column :players, :token, :string
    add_index :players, :token
  end
end
