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
    expect(invoice["id"]).to eq(@invoice.id)
  end

  it "can return the associated item" do
    get "/api/v1/invoice_items/#{@invoice_item.id}/item"

    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item["id"]).to eq(@item.id)
  end
 
  it "can find a specific invoice_items" do
    get "/api/v1/invoice_items/find?id=#{@invoice_item.id}"
    
    invoice_item = JSON.parse(response.body)
    expect(response).to be_success
    expect(invoice_item["id"]).to eq @invoice_item.id 
  end 

  it "can find all invoice_items with an invoice id " do
    invoice_item_2 = build(:invoice_item, invoice: @invoice, item: @item)
    get "/api/v1/invoice_items/find_all?id=#{@invoice_item.id}"
    
    invoice_item = JSON.parse(response.body)
    expect(response).to be_success
    expect(invoice_item.count).to eq 1
  end 
 end