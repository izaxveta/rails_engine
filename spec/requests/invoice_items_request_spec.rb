require "rails_helper"

RSpec.describe "Invoice Items API" do
 before(:each) do 
    @customer = create(:customer)
    @merchant = create(:merchant)
    @item     = create(:item, merchant: @merchant)
    @invoice  = create(:invoice, customer: @customer, merchant: @merchant)
    @invoice_item = create(:invoice_item, invoice: @invoice, item: @item)
 end 
 
 
  it "sends a list of merchants" do
    # invoice_item = create(:invoice_item, item: item, invoice: invoice)
    create_list(:invoice_item, 8, item: @item, invoice: @invoice)
    
    get '/api/v1/invoice_items'

    expect(response).to be_success

    invoice_items = JSON.parse(response.body)
    expect(invoice_items.count).to eq 9
  end

  it 'can obtain one invoice item by the :id' do
    id = create(:invoice_item, item: @item, invoice: @invoice).id

    get "/api/v1/invoice_items/#{id}"

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer["id"]).to eq(id)
  end

  it "can return a list of associated invoice" do

    get "/api/v1/invoice_items/#{@invoice_item.id}/invoice"

    invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice.count).to eq 6
  end

  it "can return the associated item" do 
    get "/api/v1/invoice_items/#{@invoice_item.id}/item"

    item = JSON.parse(response.body)
    
    expect(response).to be_success
    expect(item.count).to eq 7 
  end 
 end 