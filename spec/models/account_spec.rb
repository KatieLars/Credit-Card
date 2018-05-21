require 'rails_helper'
require 'pry'


RSpec.describe Account, type: :model do
  before(:each) do
  @account = Account.create(apr: 35, credit_limit: 1000, opening_date: Date.today.days_ago(30), current_balance: 500) #date is 30 days from today
  @first_transaction = @account.transactions.build(amount: -200)
  @first_transaction.date = @account.opening_date.days_since(15)
  @first_transaction.balance
  @first_transaction.interest
  @first_transaction.save
  @second_transaction = @account.transactions.build(amount: 100)
  @second_transaction.date = @account.opening_date.days_since(25)
  @second_transaction.balance
  @second_transaction.interest
  @second_transaction.save
end

it "has many transactions" do
  expect(@account.transactions.count).to eq(2)
end

describe ":interest_from_last_transaction" do
  it "calculates the total interest from today to the date of the last transaction" do
    last_trans_interest = @account.interest_from_last_transaction.round(2)
    expect(last_trans_interest).to eq(1.92)
  end
end

describe ":total_interest" do
  it "calculates the total interest of all transactions" do
    all_interest = @account.total_interest.round(2)
    expect(all_interest).to eq(11.99)
  end
end

describe ":total_with_interest" do
  it "adds total interest to last balance" do
      total_owed = @account.total_with_interest.round(2)
      expect(total_owed).to eq(411.99)
  end
end

end
