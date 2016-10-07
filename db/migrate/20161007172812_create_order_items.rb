class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer  :order_id
      t.integer  :product_id
      t.integer  :quantity,      default: 1
      t.decimal  :shipping_cost, default: 0.0
      t.decimal  :price,         default: 0.0
      t.string   :img_file
      t.string   :name
      t.timestamps null: false
    end
  end
end
