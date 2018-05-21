class AccountsController < ApplicationController

  def index

  end

  def show
    #shows the entire collection of transaction and account info
  end

  def create
    @account = Account.create(apr: 35, opening_date: Date.today, credit_limit: 1000)
    render 'show'
  end

  def new
    #open a new account
  end


end
