class AddReceptionToGuests < ActiveRecord::Migration
  def change
    add_column :guests, :reception, :string
  end
end
