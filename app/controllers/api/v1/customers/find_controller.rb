class Api::V1::Customers::FindController < ApplicationController
  def index
    render json: Customer.find_customer(customer_params)
  end

  private

  def customer_params
    params.permit(:id, :first_name, :last_name, :created_at, :updated_at)
  end
end