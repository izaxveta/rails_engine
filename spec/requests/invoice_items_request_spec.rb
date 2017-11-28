require "rails_helper"

describe "Invoice Items API" do
  it "sends a list of merchants" do
     customer = create(:customer)
     merchant = create(:merchant)
     item     = create(:item, merchant: merchant)
     invoice  = create(:invoice, customer: customer, merchant: merchant)
   
    # invoice_item = create(:invoice_item, item: item, invoice: invoice)
    
    create_list(:invoice_item, 8, item: item, invoice: invoice)
    
    get '/api/v1/invoice_items'

    expect(response).to be_success

    invoice_items = JSON.parse(response.body)
    expect(invoice_items.count).to eq 8
  end

  it 'can obtain one invoice item by the :id' do
    customer = create(:customer)
    merchant = create(:merchant)
    item     = create(:item, merchant: merchant)
    invoice  = create(:invoice, customer: customer, merchant: merchant)
   
    id = create(:invoice_item, item: item, invoice: invoice).id

    get "/api/v1/invoice_items/#{id}"

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer["id"]).to eq(id)
  end
end 