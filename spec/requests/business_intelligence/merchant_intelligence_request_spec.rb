require 'rails_helper'

RSpec.describe 'Merchant Business Intel API' do
  it 'can obtain all merchants ranked by total revenue' do
    merchant1 = create(:merchant)
    merchant2 = create(:merchant)
    merchant3 = create(:merchant)

    customer = create(:customer)

    invoice1 = create(:invoice, merchant: merchant1, customer: customer)
    invoice2 = create(:invoice, merchant: merchant1, customer: customer)
    invoice3 = create(:invoice, merchant: merchant2, customer: customer)

    item1 = create(:item, merchant: merchant1)
    item2 = create(:item, merchant: merchant2)

    invoice_item1 = create(:invoice_item, invoice: invoice1, item: item1)
    invoice_item2 = create(:invoice_item, invoice: invoice1, item: item2)
    invoice_item3 = create(:invoice_item, invoice: invoice2, item: item1)
    invoice_item4 = create(:invoice_item, invoice: invoice3, item: item2)

    transaction1 = create(:transaction, invoice: invoice1)
    transaction2 = create(:transaction, invoice: invoice2)
    transaction3 = create(:transaction, invoice: invoice3)

    get "/api/v1/merchants/most_revenue?quantity=1"

    content = JSON.parse(response.body)

    expect(response).to be_success
    expect(content.first["id"]).to eq(merchant1.id)
    expect(content.count).to eq(1)

    get "/api/v1/merchants/most_revenue?quantity=2"

    content = JSON.parse(response.body)

    expect(response).to be_success
    expect(content.first["id"]).to eq(merchant1.id)
    expect(content.last["id"]).to eq(merchant2.id)
    expect(content.count).to eq(2)
  end



end