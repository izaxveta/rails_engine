class Api::V1::Customers::FavoriteMerchantController < ApplicationController

  def index
    render json: Customer.favorite_merchant(customer_params["customer_id"].to_i)
  end

  private

  def customer_params
    params.permit(:customer_id)
  end
end