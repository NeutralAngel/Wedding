class AddWeddingToGuests < ActiveRecord::Migration
  def change
    add_column :guests, :wedding, :string
  end
end
