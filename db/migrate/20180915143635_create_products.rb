class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :code
      t.decimal :price, precision: 6, :scale => 2
      t.string :image
      t.references :vat, foreign_key: true

      t.timestamps
    end
  end
end
