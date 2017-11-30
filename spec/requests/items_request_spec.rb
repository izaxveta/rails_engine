require "rails_helper"

describe "Item API" do
  before(:each) do
    @customer = create(:customer)
    @merchant = create(:merchant)
    @item     = create(:item, merchant: @merchant)
    @invoice = create(:invoice, customer: @customer, merchant: @merchant)
  end 
  it "sends a list of items" do
    item_2 = create(:item, merchant: @merchant)
    get '/api/v1/items'
    
    items = JSON.parse(response.body)
    expect(response).to be_success

    expect(items.count).to eq 2 

  end

  it 'can obtain one merchant by the :id' do
    id = create(:item, merchant: @merchant).id

    get "/api/v1/items/#{id}"

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer["id"]).to eq(id)
  end

  it "can return a collection of associated invoice items" do 
    invoice_item_1 = create(:invoice_item, invoice: @invoice, item: @item)
    invoice_item_2 = create(:invoice_item, invoice: @invoice, item: @item)

    get "/api/v1/items/#{@item.id}/invoice_items"

    invoice_items = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_items.count).to eq 2 
  end
   
  it "can return its associated merchant" do 
    get "/api/v1/items/#{@item.id}/merchant"

    merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchant["name"]).to eq "Walgreens"
    
  end 
end
