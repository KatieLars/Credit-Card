class TransactionsController < ApplicationController

  def new
    @account = Account.find_by(id: params[:account_id])
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.account_id = params[:account_id]
    @transaction.date = Date.today
    binding.pry
    @transaction.balance
    @transaction.interest_accrued
    #add other methods here to fill out Transaction
    redirect_to account_path(@transaction.account_id)
  end

  private

  def transaction_params
    params.require(:transaction).permit(:amount)
  end

end
