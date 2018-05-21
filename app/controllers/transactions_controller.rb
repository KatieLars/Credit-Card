class TransactionsController < ApplicationController

  def new
  end

  def create
    @transaction = Transaction.create(amount: params[:amount], date: Date.today, account_id: params[:id] )
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
