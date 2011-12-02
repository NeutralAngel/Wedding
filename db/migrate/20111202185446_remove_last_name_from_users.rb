class RemoveLastNameFromUsers < ActiveRecord::Migration
  def up
    change_table :users do |t|
      t.remove :last_name
      t.rename :first_name, :name
    end
  end

  def down
    change_table :users do |t|
      t.string :last_name
      t.rename :name, :first_name
    end
  end
end
