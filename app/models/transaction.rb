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

  def new_balance(amount) #the difference between this and current balance is that
    #current balance changes every time there is a transaction
    last_trans = self.account.transactions.last
    if last_trans #if there is a last transaction
      last_trans.new_balance + amount
    else #otherwise goes straight to the current balance
      self.account.current_balance + amount
    end
  end

  def interest_accrued
    #calculates the interest accrued since last transaction
    self.account.transactions
    #eg. For 10 days, at 500 balance, interest is 500*.35/365*10
  end

  def interest_calculator #calculates the interest for each transaction

  end
end
