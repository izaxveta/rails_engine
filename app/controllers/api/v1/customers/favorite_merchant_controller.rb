class Api::V1::Customers::FavoriteMerchantController < ApplicationController

  def index
    render json: Customer.favorite_merchant(customer_params)
  end

  private

  def customer_params
    params.permit(:id)
  end
end