class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string :guest_name
      t.integer :number_of_guest
      t.boolean :yes_no
      t.text :comments

      t.timestamps null: false
    end
  end
end
