class CreditCard < ApplicationRecord
  has_many :payments
  has_many :charges

  #apr, current_balance, credit_limit, opening_date

  def calculate_current_balance
    #calculates current_balance by using payments, charges, date, apr

  end

  def calculate_daily_interest
    
  end

end
