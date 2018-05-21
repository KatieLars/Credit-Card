class Account < ApplicationRecord
  has_many :transactions
  #apr, current_balance, credit_limit, opening_date

  def total_interest #to be applied at end of month
    #adds up all the interest for all the transactions within one month
    self.transactions.sum(:interest_accrued) + self.interest_from_last_transaction
    #remember to add all interest accrued since the last transaction
  end

  def interest_from_last_transaction
    #calculates what the interest rate was between now and the last transaction
    last_trans = self.transactions.last
    interest_rate = self.apr/100
    if last_trans #if the last transaction is found
      days = (Date.today.to_date - last_trans.date.to_date).to_i
      last_trans.new_balance * interest_rate/365 * days
    else #works
      self.current_balance * interest_rate/365 * 30 #monthly, but doesn't count the first day
    end
  end

  def total_with_interest #adds balance to interest_from_last_transaction
    last_trans = self.transactions.last
    if last_trans
      last_trans.new_balance + total_interest
    else #if there had been no last transaction
      self.current_balance + self.interest_from_last_transaction
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
