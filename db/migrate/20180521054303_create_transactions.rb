class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.integer :credit_card_id
      t.date :date
      t.float :amount
      t.float :new_balance
      t.float :interest_accrued
    end
  end
end
