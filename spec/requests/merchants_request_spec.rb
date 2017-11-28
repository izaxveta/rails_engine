require 'rails_helper'

RSpec.describe 'Merchants API' do
  it 'sends a list of merchants' do
    create_list(:merchant, 8)

    get '/api/v1/merchants'

    # expect(response).to be_success
    merchants = JSON.parse(response.body)
  end
end