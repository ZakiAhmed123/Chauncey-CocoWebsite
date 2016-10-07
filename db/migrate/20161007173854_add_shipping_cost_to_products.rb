class AddShippingCostToProducts < ActiveRecord::Migration
  def change
    add_column :products,:shipping_cost, :decimal
  end
end
