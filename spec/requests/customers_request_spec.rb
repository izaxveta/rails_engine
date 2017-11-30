require 'rails_helper'

RSpec.describe 'Custsomers API' do
  before :each do
    @customer = create(:customer)
  end

  it 'sends a list of customers' do
    create_list(:customer, 8)
    get '/api/v1/customers'

    customers = JSON.parse(response.body)

    expect(response).to be_success
    expect(customers.count).to eq(9)
  end

  it 'can obtain one customer by the :id' do
    get "/api/v1/customers/#{@customer.id}"

    content = JSON.parse(response.body)

    expect(response).to be_success
    expect(content["id"]).to eq(@customer.id)
  end

  it 'can obtain all invoices for one customer' do
    merchant = create(:merchant)
    invoices = create_list(:invoice, 8, customer: @customer, merchant: merchant)

    get "/api/v1/customers/#{@customer.id}/invoices"

    content = JSON.parse(response.body)

    expect(response).to be_success
    expect(content.count).to eq(8)
  end

  it 'can obtain all transactions for one customer' do
    merchant = create(:merchant)
    invoice = create(:invoice, customer: @customer, merchant: merchant)
    transaction = create(:transaction, result: "failed", invoice: invoice)
    transaction2 = create(:transaction, result: "failed", invoice: invoice)
    transaction3 = create(:transaction, result: "success", invoice: invoice)

    get "/api/v1/customers/#{@customer.id}/transactions"

    content = JSON.parse(response.body)

    expect(response).to be_success
    expect(content.count).to eq(3)
  end
end