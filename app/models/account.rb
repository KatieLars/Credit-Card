class Account < ApplicationRecord
  has_many :payments
  has_many :charges
  #apr, current_balance, credit_limit, opening_date

  def date_from_opening
    #calculates how many days have passed from opening day from opening date
    Time.now - self.opening_date
  end

  def interest_current_balance #calculates monthly interest
    if self.date_from_opening < 30 || self.date_from_opening == 30
      @current_balance + self.daily_interest
    else
      @current_balance
    end
    #calculates current_balance by using payments, charges, date, apr
    #should be triggered every time:
      #--a new Charge is created
      #--a new Payment is created (payments are always done against principal for first 30 days, then against current_balance)
      #--30 days have passed
  end

  def payment(amount)
    @current_balance - amount
  end

  def charge(amount)
    if self.over_limit? != true
      @current_balance + amount
    end
  end

  def daily_interest
    @current_balance + (@current_balance * @apr)
    #calculates but does not apply daily interest
  end

  def over_limit?(amount) #returns true of charge puts current_balance over limit
    if @current_balance + amount > @credit_limit
      true
    end
  end

end
