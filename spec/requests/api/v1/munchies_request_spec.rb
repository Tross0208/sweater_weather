require 'rails_helper'

RSpec.describe "Munchies Request" do
  it 'returns serialized munchies' do
    get "/api/v1/munchies?location=denver,co&food=chinese"
    response_body = JSON.parse(response.body, symbolize_names: true)
    forecast = response_body[:data][:attributes][:forecast]
    restaurant = response_body[:data][:attributes][:restaurant]


    expect(response.status).to eq(200)
    expect(response_body[:data][:attributes].count).to eq(3)
    expect(response_body[:data][:attributes][:destination_city]).to be_a(String)
    expect(forecast[:summary]).to be_a(String)
    expect(forecast[:temperature]).to be_a(String)
    expect(restaurant[:name]).to be_a(String)
    expect(restaurant[:address]).to be_a(String)
  end

  it 'rejects requests without location' do
    response = get "/api/v1/munchies?food=chinese"
    expect(response).to eq(404)
  end

  it 'rejects requests without food' do
    response = get "/api/v1/munchies?location=denver,co"
    expect(response).to eq(404)
  end

  it 'rejects requests with unknown location' do
    response = get "/api/v1/munchies?location=qwertyuiop&food=chinese"
    expect(response).to eq(404)
  end

  xit 'rejects requests with unknown food' do
    #attempting to sad path test, all strings tested return a restaurant
    response = get "/api/v1/munchies?location=denver,co&food=qweasdzxc"
    expect(response).to eq(404)
  end
end
