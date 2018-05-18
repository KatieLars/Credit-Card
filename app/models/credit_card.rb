class CreditCard < ApplicationRecord
  has_many :payments
  has_many :charges

  #apr, current_balance, credit_limit, opening_date

  def calculate_current_balance
    
    #calculates current_balance by using payments, charges, date, apr
    #should be triggered every time:
      #--a new Charge is created
      #--a new Payment is created (payments are always done against principal for first 30 days, then against current_balance)
      #--30 days have passed
  end

  def calculate_daily_interest
    #calculates but does not apply daily interest
  end

end
