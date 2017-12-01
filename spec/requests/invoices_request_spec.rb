require "rails_helper"

RSpec.describe "Invoices API" do
  before(:each) do
    @customer = create(:customer)
    @merchant = create(:merchant)
    @invoice = create(:invoice, customer: @customer, merchant: @merchant)
    @item = create(:item, merchant: @merchant)
  end

    it "sends a list of merchants" do

      get '/api/v1/invoices'

      expect(response).to be_success

      items = JSON.parse(response.body)

      expect(items.count).to eq 1
    end

    it 'can obtain one merchant by the :id' do
      id = create(:invoice, customer: @customer, merchant: @merchant).id

      get "/api/v1/invoices/#{id}"

      customer = JSON.parse(response.body)
      expect(response).to be_success
      expect(customer["id"]).to eq(id)
    end

    it "endpoint returns all transactions for an invoice" do
      transaction_1 = create(:transaction, invoice: @invoice)
      transaction_2 = create(:transaction, invoice: @invoice)
      id = @invoice.id

      get "/api/v1/invoices/#{@invoice.id}/transactions"

      transactions = JSON.parse(response.body)

      expect(response).to be_success
      expect(transactions.count).to eq 2
    end

    it "endpoint returns all invoice_items for an invoice" do
      invoice_item_1 = create(:invoice_item, item: @item, invoice: @invoice)
      invoice_item_2 = create(:invoice_item, item: @item, invoice: @invoice)

      get "/api/v1/invoices/#{@invoice.id}/invoice_items"

      invoice_items = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_items.count).to eq 2
    end

    it "endpoint returns all items for an invoice" do
      item_1 = create(:item, merchant: @merchant)
      item_2 = create(:item, merchant: @merchant)
      invoice_item_1 = create(:invoice_item, invoice: @invoice, item: item_1)
      invoice_item_2 = create(:invoice_item, invoice: @invoice, item: item_1)

      get "/api/v1/invoices/#{@invoice.id}/items"

      items = JSON.parse(response.body)

      expect(response).to be_success
      expect(items.count).to eq 2
    end

    it "endpoint returns the associated customer" do
      get "/api/v1/invoices/#{@invoice.id}/customer"

      customer = JSON.parse(response.body)

      expect(response).to be_success
      expect(customer["id"]).to eq(@customer.id)
    end

    it "endpoint returns the associated merchant" do
      get "/api/v1/invoices/#{@invoice.id}/merchant"

      merchant = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchant["name"]).to eq "Walgreens"
    end

    it "can find a specific invoice" do
      get "/api/v1/invoices/find?name=#{@invoice.id}"
      
      invoice = JSON.parse(response.body)
      expect(response).to be_success
      expect(invoice["id"]).to eq @invoice.id 
    end 

    it "can find all invoices invoice" do
      invoice_2 = create(:invoice, customer: @customer, merchant: @merchant)
      get "/api/v1/invoices/find?name=#{@invoice.id}"
      
      invoices = JSON.parse(response.body)
      expect(response).to be_success
      expect(invoices.count).to eq 4
    end 
end
