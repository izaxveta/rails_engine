require "rails_helper"

describe "Invoices API" do
  before(:each) do
    @customer = create(:customer)
    @merchant = create(:merchant)
    @item     = create(:item, merchant: @merchant)
    @invoice = create(:invoice_item, customer: @customer, merchant: @merchant)
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

  end
end
