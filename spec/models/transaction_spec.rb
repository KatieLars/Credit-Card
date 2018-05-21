require 'rails_helper'
require 'pry'


RSpec.describe Transaction, type: :model do
  before(:each) do
  @account = Account.create(apr: 35, credit_limit: 1000, opening_date: Date.today.days_ago(30), current_balance: 500) #date is 30 days from today
  @first_transaction = @account.transactions.build(amount: -200)
  @first_transaction.date = @account.opening_date.days_since(15)
  @first_transaction.save
  @second_transaction = @account.transactions.build(amount: 100)
  @second_transaction.date = @account.opening_date.days_since(25)
  @second_transaction.save
end

it "belongs to an account" do
  expect(@first_transaction.account).to eq(@account)
end

describe "days_since_last_transaction" do
  it "returns an integer of days between transactions" do
    days = @second_transaction.days_since_last_transaction
    expect(days).to eq(10)
  end
end

describe "balance" do
  it "updates the balance based on amount deposited/charged for first transaction" do

      @first_transaction.balance
      expect(@first_transaction.new_balance).to eq(@account.current_balance + @first_transaction.amount)
  end

  it "updates the balance based on amount deposited/charged for second transaction" do
    @first_transaction.balance
    @second_transaction.balance
    expect(@second_transaction.new_balance).to eq(@first_transaction.new_balance + @second_transaction.amount)
  end
end

it "has accrued interest" do #tests accrued interest collection
  @first_transaction.interest
  expect(@first_transaction.interest_accrued.round(2)).to eq(7.19)
end


end
