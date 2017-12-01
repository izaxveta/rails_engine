class Api::V1::Merchants::FavoriteCustomerController < ApplicationController
  def index
    # byebug
    render json: Merchant.favorite_customer(merchant_params["id"])
  end

  private

  def merchant_params
    params.permit(:id)
  end
end