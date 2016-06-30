class CreateFlats < ActiveRecord::Migration
  def change
    create_table :flats do |t|
      t.integer :number
      t.integer :floor
      t.integer :entrance

      t.timestamps null: false
    end
  end
end
