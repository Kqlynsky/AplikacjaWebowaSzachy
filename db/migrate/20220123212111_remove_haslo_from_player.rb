class RemoveHasloFromPlayer < ActiveRecord::Migration[7.0]
  def change
    remove_column :players, :haslo, :string
  end
end
