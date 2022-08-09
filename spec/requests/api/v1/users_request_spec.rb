require 'rails_helper'

RSpec.describe "Users Request" do
  it 'creates user' do
    header = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
    body = {
            "email": "tim@mail.com",
            "password": "password",
            "password_confirmation": "password"
            }

    post '/api/v1/users', headers: header, params: JSON.generate(body)

    expect(response.status).to eq(201)
    expect(User.last.email).to eq("tim@mail.com")
  end
end
