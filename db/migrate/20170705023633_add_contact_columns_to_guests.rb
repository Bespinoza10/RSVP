class AddContactColumnsToGuests < ActiveRecord::Migration
  def change
    add_column :guests, :phone, :string
    add_column :guests, :email, :string
  end
end
