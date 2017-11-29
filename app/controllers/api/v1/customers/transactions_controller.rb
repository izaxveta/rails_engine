class Api::V1::Customers::TransactionsoController < ApplicationController

  def index
    customer = Customer.find(params[:id])
    render json: customer.transactions
  end 

end 