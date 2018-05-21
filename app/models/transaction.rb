class Transaction < ApplicationRecord
  belongs_to :account
  #consider adding new_balance
  #consider adding a day_number, which marks which day,
  #since the last transaction
  #consider making Charge and Payment classes one class

  #ex. Transaction: date, days_since_last_transaction, new_balance, amount, date
    #credit_card_id, over_limit: boolean, interest_accrued
  #over_limit, days_since_last_transaction, new_balance, and interest_accrued are all written here
  def over_limit?

  end

  def new_balance #the difference between this and current balance is that
    #current balance changes every time there is a transaction
    last_trans = self.account.transactions[-2]
    if last_trans #if there is a last transaction
      last_trans.new_balance + @amount
    else #otherwise goes straight to the current balance
      self.account.current_balance + @amount
    end
  end

  def interest_accrued
    #calculates the interest accrued since last transaction
    interest_rate = self.account.apr/100
    previous_balance = self.account.transactions[-2].new_balance
    previous_balance * interest_rate * self.days_since_last_transaction
    #eg. For 10 days, at 500 balance, interest is 500*.35/365*10
  end


  def days_since_last_transaction #returns an integer
    last_date = self.account.transactions[-2]
    if last_date #if there is a previous transaction
      (self.date.to_date - last_date.to_date).to_i
    else
      (self.date.to_date - self.account.opening_date.to_date).to_i + 1
    end
  end

end
