class CreateJewels < ActiveRecord::Migration
  def change
    create_table :jewels do |t|

      t.timestamps null: false
    end
  end
end
