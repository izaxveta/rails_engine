require 'rails_helper'

RSpec.describe 'Custsomers API' do
  it 'sends a list of customers' do
    create_list(:customer, 8)

    get '/api/v1/customers'

    expect(response).to be_success
    customers = JSON.parse(response.body)
    expect(customers.count).to eq(8)
  end

  it 'can obtain one customer by the :id' do
    id = create(:customer).id

    get "/api/v1/customers/#{id}"

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer["id"]).to eq(id)
  end
end