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
end
