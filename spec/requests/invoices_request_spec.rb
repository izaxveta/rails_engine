require "rails_helper"

describe "Invoices API" do
  it "sends a list of merchants" do
    customer = build(:customer)
    merchant = build(:merchant)

    get '/api/v1/invoices'

    expect(response).to be_success

    items = JSON.parse(response.body)
  end   
end 