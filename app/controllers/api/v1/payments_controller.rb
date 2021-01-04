class Api::V1::PaymentsController < ApplicationController
  def index
    render json: Payment.all.where(client_id: params[:client_id])
  end
end
