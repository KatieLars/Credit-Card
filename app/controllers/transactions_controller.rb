class TransactionsController < ApplicationController

  def new
    @account = Account.find_by(id: params[:account_id])
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.create(transaction_params)
    @transaction.date = Date.today
    @transaction.balance
    @transaction.interest_accrued
    #add other methods here to fill out Transaction
    redirect_to account_path(@transaction.account_id)
  end

  private

  def transaction_params
    params.require(:transaction).permit(:amount, :account_id)
  end

end
