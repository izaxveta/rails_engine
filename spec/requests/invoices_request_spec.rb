require "rails_helper"

describe "Invoices API" do
  it "sends a list of merchants" do
    customer = create(:customer)
    merchant = create(:merchant)
    #item     = build(:item, merchant: merchant)
    invoice = create(:invoice, customer: customer, merchant: merchant)

    get '/api/v1/invoices'

    expect(response).to be_success

    items = JSON.parse(response.body)
  end

  it 'can obtain one merchant by the :id' do
    customer = create(:customer)
    merchant = create(:merchant)
    id = create(:invoice, customer: customer, merchant: merchant).id

    get "/api/v1/invoices/#{id}"

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer["id"]).to eq(id)
  end
end 
