class AddNameColumnToBalance < ActiveRecord::Migration[5.1]
  def change
    add_column :balances, :name, :smallint, null: false, index: true
  end
end
