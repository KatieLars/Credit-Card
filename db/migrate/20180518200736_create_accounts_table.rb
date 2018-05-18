class CreateAccountsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.float :current_balance, :default => 0
      t.integer :credit_limit
      t.float :apr
      t.date :opening_date, :default => Time.now
      t.timestamp
    end
  end
end
