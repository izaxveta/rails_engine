require 'rails_helper'

RSpec.describe 'Transaction API' do
  xit 'sends a list of transactions' do
    # customer = create(:customer)
    # merchant = create(:merchant)
    # invoice  = create(:invoice, customer: customer, merchant: merchant)
    create_list(:transaction, 3, invoice: invoice)

    get '/api/v1/transactions'

    expect(response).to be_success
    transactions = JSON.parse(response.body)
    expect(transactions.count).to eq(3)
  end

  xit 'can obtain one transaction by :id' do
    # customer = create(:customer)
    # merchant = create(:merchant)
    # invoice  = create(:invoice, customer: customer, merchant: merchant)
    id = create(:transaction, invoice: invoice).id

    get "/api/v1/transactions/#{id}"

    transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(transaction["id"]).to eq(id)
  end
end