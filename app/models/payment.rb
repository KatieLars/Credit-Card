class Payment < ApplicationRecord
  belongs_to :account

  #when someone makes a payment, this needs to
    #create a new payment instance
    #recalculate current_balance

end
