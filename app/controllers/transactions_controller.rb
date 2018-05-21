class TransactionsController < ApplicationController

  def new
  end

  def create
    @transaction = Transaction.create(amount: params[:amount], date: Date.today)

    redirect_to account_path(@transaction.account_id)
  end

  private

  def transaction_params
    params.require(:transaction).permit(:amount, :account_id)
  end

end
