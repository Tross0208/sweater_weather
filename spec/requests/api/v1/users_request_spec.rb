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

  it 'rejects blank email' do
    header = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
    body = {
            "email": "",
            "password": "password",
            "password_confirmation": "password"
            }

    post '/api/v1/users', headers: header, params: JSON.generate(body)

    expect(response.status).to eq(404)
  end

  it 'rejects mismatched password' do
    header = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
    body = {
            "email": "jim@mail.com",
            "password": "password",
            "password_confirmation": "bad password"
            }

    post '/api/v1/users', headers: header, params: JSON.generate(body)

    expect(response.status).to eq(404)
  end
end
