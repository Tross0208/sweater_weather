require 'rails_helper'

RSpec.describe "Sessions Request" do
  it 'authenticates and returns user' do
    User.create(email: "tim@example.com", password: "password", api_key: "buncharandomchars")
    header = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
    body = {
            "email": "tim@example.com",
            "password": "password"
            }

    post '/api/v1/sessions', headers: header, params: JSON.generate(body)
    response_body = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(200)
    expect(response_body[:data][:id]).to be_an(Integer)
    expect(response_body[:data][:attributes][:email]).to eq("tim@example.com")
    expect(response_body[:data][:attributes][:api_key]).to be_a(String)
  end

  it 'rejects unregistered email' do
    User.create(email: "tim@example.com", password: "password", api_key: "buncharandomchars")
    header = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
    body = {
            "email": "timmmy@badexample.com",
            "password": "password"
            }

    post '/api/v1/sessions', headers: header, params: JSON.generate(body)
    response_body = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(404)
    expect(response_body[:error]).to eq("Invalid Credentials")
  end

  it 'rejects wrong password' do
    User.create(email: "tim@example.com", password: "password", api_key: "buncharandomchars")
    header = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
    body = {
            "email": "timmmy@example.com",
            "password": "badpassword"
            }

    post '/api/v1/sessions', headers: header, params: JSON.generate(body)
    response_body = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(404)
    expect(response_body[:error]).to eq("Invalid Credentials")
  end
end
