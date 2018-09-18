class CreateVats < ActiveRecord::Migration[5.2]
  def change
    create_table :vats do |t|
      t.string :name
      t.decimal :percent, precision: 4, scale: 2

      t.timestamps
    end
  end
end
