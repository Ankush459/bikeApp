class CreateCycles < ActiveRecord::Migration[5.0]
  def change
    create_table :cycles do |t|
      t.string :firstname
      t.string :lastname
      t.string :destination
      t.decimal :cost
      t.string :color

      t.timestamps
    end
  end
end
