class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.integer :account_id
      t.date :date
      t.float :amount
      t.float :new_balance
      t.float :interest_accrued
    end
  end
end
