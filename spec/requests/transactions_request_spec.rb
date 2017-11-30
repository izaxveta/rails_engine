require 'rails_helper'

RSpec.describe 'Transaction API' do
  before :each do
    @customer = create(:customer)
    @merchant = create(:merchant)
    @invoice  = create(:invoice, customer: @customer, merchant: @merchant)
  end

  it 'sends a list of transactions' do
    create_list(:transaction, 3, invoice: @invoice)

    get '/api/v1/transactions'

    expect(response).to be_success
    transactions = JSON.parse(response.body)
    expect(transactions.count).to eq(3)
  end

  it 'can obtain one transaction by :id' do
    id = create(:transaction, invoice: @invoice).id

    get "/api/v1/transactions/#{id}"

    transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(transaction["id"]).to eq(id)
  end

  it 'can obtain invoice for one transaction' do
    id = create(:transaction, invoice: @invoice).id

    get "/api/v1/transactions/#{id}/invoice"

    invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice["id"]).to eq(@invoice.id)
  end
end