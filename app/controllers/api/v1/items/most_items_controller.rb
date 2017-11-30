class Api::V1::Items::MostItemsController < ApplicationController

  def index
    quantity = item_params['quantity']
    render json: Item.most_items(quantity)
  end 

  def item_params
    params.permit(:quantity)
  end
end 