class FixProducts < ActiveRecord::Migration
  def change
    drop_table :gifts
    drop_table :jewels
    add_column :products, :name, :string
    add_column :products, :price, :string
    add_column :products, :size, :string
    add_column :products, :img_file, :string
    add_column :products, :description, :text
    add_column :products, :bullet_1, :string
    add_column :products, :bullet_2, :string
    add_column :products, :bullet_3, :string
    add_column :products, :bullet_4, :string
    add_column :products, :bullet_5, :string
    add_column :products, :bullet_6, :string
  end
end
