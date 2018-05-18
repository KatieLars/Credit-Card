class CreateCreditCardsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :credit_cards do |t|
      t.decimal :current_balance
      t.integer :credit_limit
      t.decimal :apr
      t.date :opening_date
      t.timestamp
    end
  end
end
