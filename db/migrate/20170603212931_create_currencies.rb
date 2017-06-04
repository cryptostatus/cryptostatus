class CreateCurrencies < ActiveRecord::Migration[5.1]
  def change
    create_table :currencies do |t|
      t.column :name, :smallint, index: true, null: false
      t.float :price, null: false
      t.timestamps
    end
  end
end
