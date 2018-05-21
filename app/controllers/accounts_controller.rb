class AccountsController < ApplicationController

  def index

  end

  def search
    @account = Account.find_by(id: params[:id])
    redirect_to account_path(@account)
  end

  def show
    @account = Account.find_by(id: params[:id])
    #shows the entire collection of transaction and account info
  end

  def create
    @account = Account.create(apr: 35, opening_date: Date.today, credit_limit: 1000)
    redirect_to @account
  end

end
