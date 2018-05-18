class CreateCharges < ActiveRecord::Migration[5.1]
  def change
    create_table :charges do |t|
      t.decimal :amount
      t.integer :credit_card_id
      t.date :date
      t.timestamp
    end
  end
end