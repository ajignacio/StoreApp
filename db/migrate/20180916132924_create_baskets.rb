class CreateBaskets < ActiveRecord::Migration[5.2]
  def change
    create_table :baskets do |t|
      t.string :status, default: "order"
      t.string :email
      t.string :phone
      t.text :user_cookie
      t.datetime :date_order
      t.references :product
      t.integer :qty, default: 1
      

      t.timestamps
    end
  end
end
