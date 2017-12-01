class Api::V1::CustomersController < ApplicationController
  def index
    render json: Customer.all#, serializer: CustomerSerializer
  end

  def show
    render json: Customer.find(params[:id]), serializer: CustomerSerializer
  end
end