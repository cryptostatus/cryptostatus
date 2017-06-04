class AddNotifiedAtToBalances < ActiveRecord::Migration[5.1]
  def change
    add_column :balances, :notified_at, :datetime
  end
end
