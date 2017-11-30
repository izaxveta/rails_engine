require 'rails_helper'

RSpec.describe 'Merchants API' do
  
  before (:each) do 
    @merchant = create(:merchant)
    @customer = create(:customer)
    item_1 = @merchant.items.create(
      name: "Icecream Cone",
      description: "cold",
      unit_price: 1.5,
    )
    
    item_2 = @merchant.items.create(
      name: "Icecream Cone",
      description: "cold",
      unit_price: 1.5,
    )
    
    invoice = @merchant.invoices.create(
      customer_id: @customer.id,
      status: "Shipped"
    ) 

  end 
    
    it 'sends a list of merchants' do
      create_list(:merchant, 8)

      get '/api/v1/merchants'

      expect(response).to be_success
      merchants = JSON.parse(response.body)
      expect(merchants.count).to eq(9) #list plus one from before(:each)
    end

    it 'can show one merchant by the :id' do
      id = create(:merchant).id

      get "/api/v1/merchants/#{id}"

      merchant = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchant["id"]).to eq(id)
    end

    it 'can find a single merchant by attributes' do
      get "/api/v1/merchants/find?name=Walgreens"

      merchants = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchants["name"]).to eq "Walgreens"
    end 

    it 'can find all merchants with attribute' do

      merchant2 = create(:merchant)

      get "/api/v1/merchants/findall?name=Walgreens"

      merchants = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchants.count).to eq 2
 
    end 

    it ":id/items returns the merchant's items" do
      #this route should exist but is erroring out. 
      get "/api/vi/merchants/#{@merchant.id}/items"

      items = JSON.parse(response.body)

      expect(response).to be_success
      expect(items.count).to eq 2

    end 
end