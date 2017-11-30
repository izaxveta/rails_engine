class Api::V1::Items::FindAllController < ApplicationController
  def index
    render json: Item.where(item_params)
  end

  private

  def item_params
    params[:unit_price].delete!(".") if params[:unit_price]
    params.permit(:id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at)
  end
end