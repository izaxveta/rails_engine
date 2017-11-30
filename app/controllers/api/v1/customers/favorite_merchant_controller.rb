class Api::V1::Customers::FavoriteMerchantController < ApplicationController

    def index
      merchant = Customer.favorite_merchant(customer_params).first
      render json: Merchant.find(merchant.merchant_id)
    end 


    private 

    def customer_params 
      params.permit(:id)
    end 
end 