class Payment < ApplicationRecord
  belongs_to :credit_card

  #when someone makes a payment, this needs to
    #create a new payment instance
    #recalculate current_balance
  
end
