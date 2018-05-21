class Account < ApplicationRecord
  has_many :transactions
  #apr, current_balance, credit_limit, opening_date

  def days_from_opening #returns integer
    #returns the total days from opening based on when you access the information
    #calculates how many days have passed from opening day from opening date
    #Error: cannot transform Time into integer to do the subtraction
  end

  def order_activity #orders all activities

    #returns an array of objects ordered by date
    #most recent object comes last
    #this can be used on the account show page to show all transactions
  end

  def days_since_last_transaction
    #days since last transaction on this card
  end

  def total_interest #to be applied at end of month
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
