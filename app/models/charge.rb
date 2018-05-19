class Charge < ApplicationRecord
  belongs_to :account
  #consider adding new_balance
  #consider adding a day_number, which marks which day,
  #since the last transaction
  #consider making Charge and Payment classes one class

  #ex. Transaction: date, days_since_last_transaction, new_balance, amount, date
    #credit_card_id, over_limit: boolean
  #over_limit, days_since_last_transaction, new_balance are all written here
  def interest_calculator #calculates the interest for each transaction

  end
end
