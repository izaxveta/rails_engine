require "rails_helper"

describe "Invoices API" do
  it "sends a list of items" do
    customer = create(:customer)
    merchant = create(:merchant)
    item     = create(:item, merchant: merchant)
    

    get '/api/v1/items'

    expect(response).to be_success

    items = JSON.parse(response.body)
  end

  it 'can obtain one merchant by the :id' do
    customer = build(:customer)
    merchant = build(:merchant)
    id = create(:item).id

    get "/api/v1/items/#{id}"

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer["id"]).to eq(id)
  end
end
