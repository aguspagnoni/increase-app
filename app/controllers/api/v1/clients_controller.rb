class Api::V1::ClientsController < ApplicationController
  def index
   render json: Client.all
  end

  def show
    render json: Client.find(params[:id])
  end
end
