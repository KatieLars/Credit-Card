require 'rails_helper'
require 'pry'


RSpec.describe Transaction, type: :model do
  before(:each) do
  @account = Account.create(apr: 35, credit_limit: 1000, opening_date: Date.today, current_balance: 500) #date is 30 days from today
  @first_transaction = @account.transactions.build(amount: -200)
  @first_transaction.date = @account.opening_date.days_since(15)
  @first_transaction.save
  @second_transaction = @account.transactions.build(amount: 100)
  @second_transaction.date = @account.opening_date.days_since(25)
  @second_transaction.save
end

it "belongs to an account" do
  expect(@transaction.account.count).to eq(1)
end

it "has accrued interest" do #tests accrued interest collection
  accrued_interest = @first_transaction.interest_accrued.round(2)
  expect(accrued_interest).to eq(7.19)
end

describe "first transaction has a new balance" do
  it "updates the balance based on amount deposited/charged for first transaction" do
      updated_balance = @first_transaction.balance
      expect(updated_balance).to eq(@account.current_balance + @first_transaction.amount)
  end

  it "updates the balance based on amount deposited/charged for second transaction" do
    second_update = @second_transaction.balance
    expect(second_update).to eq(@first_transaction.new_balance + @second_transaction.amount)
  end
end

describe "::expiration_zone" do
  it "returns items between their storage min and storage max dates" do
    items = ["beef stew", "apple pie"]
    expect(Item.expiration_zone.pluck(:title)).to eq(items)
  end
end

describe "::still_good" do
  it "return items that have not yet reached their storage min" do
    items = ["casserole", "curry", "beef patties", "broth", "cow parts", "broccoli"]
    expect(Item.still_good.pluck(:title)).to eq(items)
  end
end

describe "::expiration_this_week" do
  it "returns a list of items that are expiring this week" do
    items = ["broth"]
    expect(Item.expiration_this_week.pluck(:title)).to eq(items)
  end
end

describe "::expiration_one_month" do
  it "returns a list of items expiring in the next month" do
    items = ["beef stew", "broth", "cow parts", "apple pie"]
    expect(Item.expiration_one_month.pluck(:title)).to eq(items)
  end
end



end
