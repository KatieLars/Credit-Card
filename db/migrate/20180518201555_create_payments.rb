class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.float :amount
      t.integer :credit_card_id
      t.date :date
      t.timestamp
    end
  end
end
