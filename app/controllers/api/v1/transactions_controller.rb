class Api::V1::TransactionsController < ApplicationController
  def index
    client = Client.find(params[:client_id])
    payment = Payment.where(client_id: client)
    transactions = Transaction.where(payment_id: payment)
    render json: transactions

  end
end
