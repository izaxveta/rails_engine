require "rails_helper"

RSpec.describe "Invoices API" do
  before(:each) do
    customer = create(:customer)
    merchant = create(:merchant)
    invoice = create(:invoice, customer: customer, merchant: merchant)
    item = create(:item)
  end 

    it "sends a list of merchants" do

      get '/api/v1/invoices'

      expect(response).to be_success

      items = JSON.parse(response.body)

      expect(items.count).to eq 
    end

    it 'can obtain one merchant by the :id' do
      id = create(:invoice, customer: customer, merchant: merchant).id

      get "/api/v1/invoices/#{id}"

      customer = JSON.parse(response.body)

      expect(response).to be_success
      expect(customer["id"]).to eq(id)
    end

    it "endpoint returns all transactions for an invoice" do
      transaction_1 = create(:transaction)
      transaction_2 = create(:transaction)
      get "/api/v1/#{invoice.id}/transactions"

      transactions = JSON.parse(response.body)

      expect(response).to be_success
      expect(transactions.count).to eq 2 
    end 

    it "endpoint returns all invoice_items for an invoice" do
      invoice_item_1 = build(:invoice_item, item_id: item.id, invoice_id: invoice.id)
      invoice_item_2 = build(:invoice_item, item_id: item.id, invoice_id: invoice.id)

      get "api/v1/#{invoice.id}/invoice_items"

      invoice_items = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_items.count).to eq 2 
    end 

    it "endpoint returns all items for an invoice" do
      item_1 = create(:item, merchant_id: merchant.id)
      item_2 = create(:item, merchant_id: merchant.id)

      get "api/v1/#{invoice.id}/items"

      items = JSON.parse(response.body)

      expect(response).to be_success
      expect(items.count).to eq 2 
    end 

    it "endpoint returns the associated customer" do
      get "api/v1/#{invoice.id}/customer"

      customer = JSON.parse(response.body)
      expect(response).to be_success
      expect(customer.count).to eq 1 
    end 

    it "endpoint returns the associated merchant" do
      get "api/v1/#{invoice.id}/merchant"

      merchant = JSON.parse(response.body)
      expect(dogs).to eq(4)
      expect(response).to be_success
      expect(merchant.count).to eq 1 
    end
end 
