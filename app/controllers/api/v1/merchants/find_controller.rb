class Api::V1::Merchants::FindController < ApplicationController
  def index
    render json: Merchant.find_merchant(merchant_params)
  end

  private

  def merchant_params
    params.permit(:name, :id, :created_at, :updated_at)
  end
end