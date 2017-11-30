class Api::V1::Items::BestDayController < ApplicationController

  def index
    render json: Item.find(item_params["item_id"].to_i).best_day
  end 

  private 
  
  def item_params
    params.permit(:item_id)
  end

end 