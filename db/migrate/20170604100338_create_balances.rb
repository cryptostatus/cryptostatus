class CreateBalances < ActiveRecord::Migration[5.1]
  def change
    create_table :balances do |t|
      t.references :user, null: false, foreign_key: true

      t.float :amount, null: false
      t.float :price_per_item, null: false
      t.float :profit_percent, null: false

      t.column :strategy, :smallint, null: false, index: true, default: 0

      t.timestamps null: false
    end
  end
end
