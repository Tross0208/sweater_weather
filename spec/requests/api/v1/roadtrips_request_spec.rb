require 'rails_helper'

RSpec.describe "Roadtrips Request" do
  it 'returns roadtrip json for short trip (hours)', :vcr do
    User.create(email: "tim@example.com", password: "password", api_key: "buncharandomchars")
    header = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
    body = {
            "origin": "Denver,CO",
            "destination": "Pueblo,CO",
            "api_key": "buncharandomchars"
            }

    post '/api/v1/road_trip', headers: header, params: JSON.generate(body)
    response_body = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(200)
    expect(response_body[:data][:attributes][:start_city]).to eq("Denver,CO")
    expect(response_body[:data][:attributes][:end_city]).to eq("Pueblo,CO")
    expect(response_body[:data][:attributes][:travel_time]).to be_a(String)
    expect(response_body[:data][:attributes][:weather_at_eta][:temperature]).to be_an(Integer)
    expect(response_body[:data][:attributes][:weather_at_eta][:conditions]).to be_a(String)
  end

  it 'returns roadtrip json for long trip (days)' do
    User.create(email: "tim@example.com", password: "password", api_key: "buncharandomchars")
    header = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
    body = {
            "origin": "Syracuse, NY",
            "destination": "Panama City, Panama",
            "api_key": "buncharandomchars"
            }

    post '/api/v1/road_trip', headers: header, params: JSON.generate(body)
    response_body = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(200)
    expect(response_body[:data][:attributes][:start_city]).to eq("Syracuse, NY")
    expect(response_body[:data][:attributes][:end_city]).to eq("Panama City, Panama")
    expect(response_body[:data][:attributes][:travel_time]).to be_a(String)
    expect(response_body[:data][:attributes][:weather_at_eta][:temperature]).to be_an(Integer)
    expect(response_body[:data][:attributes][:weather_at_eta][:conditions]).to be_a(String)
  end

  it 'returns impossible travel' do
    User.create(email: "tim@example.com", password: "password", api_key: "buncharandomchars")
    header = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
    body = {
            "origin": "Syracuse, NY",
            "destination": "London, UK",
            "api_key": "buncharandomchars"
            }

    post '/api/v1/road_trip', headers: header, params: JSON.generate(body)
    response_body = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(200)
    expect(response_body[:data][:attributes][:start_city]).to eq("Syracuse, NY")
    expect(response_body[:data][:attributes][:end_city]).to eq("London, UK")
    expect(response_body[:data][:attributes][:travel_time]).to eq("Impossible")
    expect(response_body[:data][:attributes][:weather_at_eta][:temperature]).to eq("")
    expect(response_body[:data][:attributes][:weather_at_eta][:conditions]).to eq("")
  end

  it 'rejects bad api key' do
    User.create(email: "tim@example.com", password: "password", api_key: "buncharandomchars")
    header = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
    body = {
            "origin": "Syracuse, NY",
            "destination": "London, UK",
            "api_key": "bad"
            }

    post '/api/v1/road_trip', headers: header, params: JSON.generate(body)

    expect(response.status).to eq(401)
  end

  it 'rejects missing api key' do
    User.create(email: "tim@example.com", password: "password", api_key: "buncharandomchars")
    header = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
    body = {
            "origin": "Syracuse, NY",
            "destination": "London, UK",
            "api_key": ""
            }

    post '/api/v1/road_trip', headers: header, params: JSON.generate(body)

    expect(response.status).to eq(401)
  end
end
