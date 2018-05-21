class Transaction < ApplicationRecord
  belongs_to :account

  after_create :balance
  after_create :interest

  def balance #the difference between this and current balance is that
    #current balance changes every time there is a transaction
    last_trans = self.account.transactions[-2]
    if last_trans && last_trans != self
      #if there is a last transaction, and that is not the same as the self
      self.new_balance = last_trans.new_balance + self.amount
    else #otherwise goes straight to the current balance
      #works
      self.new_balance = self.account.current_balance + self.amount
    end
    self.save
  end

  def interest  #calculates the interest accrued since last transaction
    interest_rate = self.account.apr/100
    last_trans = self.account.transactions[-2]
    if last_trans && last_trans != self #if there is a previous transaction
      self.interest_accrued = last_trans.new_balance * interest_rate/365 * self.days_since_last_transaction
    else #goes to opening date
      #works
      self.interest_accrued = self.account.current_balance * interest_rate/365 * self.days_since_last_transaction
    end
    self.save
    #eg. For 10 days, at 500 balance, interest is 500*.35/365*10
  end


  def days_since_last_transaction #returns an integer
    last_trans = self.account.transactions[-2]
    if last_trans && last_trans != self #if there is a previous transaction
      (self.date.to_date - last_trans.date.to_date).to_i
    else #this works
      (self.date.to_date - self.account.opening_date.to_date).to_i
      #-1 is to accomodate for opening day being interest free
    end
  end

end
