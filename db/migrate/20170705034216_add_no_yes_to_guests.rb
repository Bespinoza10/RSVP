class AddNoYesToGuests < ActiveRecord::Migration
  def change
    add_column :guests, :no_yes, :boolean
  end
end
