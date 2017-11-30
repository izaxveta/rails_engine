class Api::V1::Merchants::FavoriteCustomerController < ApplicationController
  def index
    render json: Merchant.favorite_customer(merchant_params)
  end

  private

  def merchant_params
    params.permit(:merchant_id)
  end
end