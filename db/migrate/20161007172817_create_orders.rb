class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.datetime "purchased_at"
      t.string   "status",        default: "cart"
      t.text     "address_line1"
      t.string   "address_city"
      t.string   "address_state"
      t.string   "address_zip"
      t.string   "name"
      t.string   "phone_number"
      t.integer  "shipping_cost", default: 1
      t.string   "email"
      t.timestamps null: false
    end
  end
end
