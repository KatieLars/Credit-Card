class Account < ApplicationRecord
  has_many :transactions
  #apr, current_balance, credit_limit, opening_date

  def days_from_opening #returns integer
    #returns the total days from opening based on when you access the information
    #calculates how many days have passed from opening day from opening date
    #Error: cannot transform Time into integer to do the subtraction
  end

  def total_interest #to be applied at end of month
    #adds up all the interest for all the transactions within one month
    self.transactions.sum(:interest_accrued) + self.interest_from_last_transaction
    #remember to add all interest accrued since the last transaction
  end

  def interest_from_last_transaction
    last_trans = self.transactions.last
      interest_rate = @apr/100
    if last_trans #if the last transaction is found
      days = (Date.today.to_date - last_trans.date.to_date).to_i
      interest_rate = @apr/100
      @current_balance * interest_rate * days
    else #if there has been no account activity
      @current_balance * interest_rate * 29 #monthly, but doesn't count the first day
    end


  end

  def payment(amount) #alters current balance (also, a payment instance should be created)
    @current_balance - amount
  end

  def charge(amount) #alters current balance
    if self.over_limit? != true
      @current_balance + amount
    end
  end

  def daily_interest#this needs to deployed everytime a new transaction happens.
    #this is how
    @current_balance + (@current_balance * @apr/365*self.time_since_last_transaction)
    #calculates but does not apply daily interest
  end

  def over_limit?(amount) #returns true of charge puts current_balance over limit
    if @current_balance + amount > @credit_limit
      true
    end
  end

end
