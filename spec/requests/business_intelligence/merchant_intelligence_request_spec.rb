require 'rails_helper'

RSpec.describe 'Merchant Business Intel API' do
  before :each do
    @merchant1 = create(:merchant)
    @merchant2 = create(:merchant)
    @merchant3 = create(:merchant)

    @customer = create(:customer)
    @customer2 = create(:customer)

    @invoice1 = create(:invoice, merchant: @merchant1, customer: @customer, created_at: "2012-03-25 09:54:09 UTC")
    @invoice2 = create(:invoice, merchant: @merchant1, customer: @customer, created_at: "2012-04-25 09:54:09 UTC")
    @invoice3 = create(:invoice, merchant: @merchant2, customer: @customer2, created_at: "2012-05-25 09:54:09 UTC")

    @item1 = create(:item, merchant: @merchant1)
    @item2 = create(:item, merchant: @merchant2)

    @invoice_item1 = create(:invoice_item, invoice: @invoice1, item: @item1)
    @invoice_item2 = create(:invoice_item, invoice: @invoice1, item: @item2)
    @invoice_item3 = create(:invoice_item, invoice: @invoice2, item: @item1)
    @invoice_item4 = create(:invoice_item, invoice: @invoice3, item: @item2)

    @transaction1 = create(:transaction, invoice: @invoice1)
    @transaction2 = create(:transaction, invoice: @invoice2)
    @transaction3 = create(:transaction, invoice: @invoice3)
  end

  context "acrosss all merchants" do
    it 'can obtain x # of merchants ranked by most_revenue' do
      get "/api/v1/merchants/most_revenue?quantity=1"

      content = JSON.parse(response.body)

      expect(response).to be_success
      expect(content.first["id"]).to eq(@merchant1.id)
      expect(content.count).to eq(1)

      get "/api/v1/merchants/most_revenue?quantity=2"

      content = JSON.parse(response.body)

      expect(response).to be_success
      expect(content.first["id"]).to eq(@merchant1.id)
      expect(content.last["id"]).to eq(@merchant2.id)
      expect(content.count).to eq(2)
    end

    it 'can obtain x # of merchants ranked by most_items sold' do
      get "/api/v1/merchants/most_items?quantity=1"

      content = JSON.parse(response.body)

      expect(response).to be_success
      expect(content.first["id"]).to eq(@merchant1.id)
      expect(content.count).to eq(1)

      get "/api/v1/merchants/most_items?quantity=2"

      content = JSON.parse(response.body)

      expect(response).to be_success
      expect(content.first["id"]).to eq(@merchant1.id)
      expect(content.last["id"]).to eq(@merchant2.id)
      expect(content.count).to eq(2)
    end

    it 'can return the total revenue across all merchants for a given date' do

      # get "/api/v1/merchants/revenue?date=2012-03-25 09:54:09 UTC"

      # content = JSON.parse(response.body)

      # expect(response).to be_success
      # byebug
      # expect(content.first["id"]).to eq(@invoice1.id)
      # expect(content.count).to eq(1)

      # FIX PRICE FIRST
    end
  end

  context "for one merchant" do
    it 'can return the favorite customer' do
      get "/api/v1/merchants/#{@merchant1.id}/favorite_customer"

      content = JSON.parse(response.body)

      # byebug
      expect(response).to be_success


      get "/api/v1/merchants/#{@merchant2.id}/favorite_customer"

      content = JSON.parse(response.body)

      expect(response).to be_success
    end
  end
end