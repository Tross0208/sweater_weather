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
    #response_body = JSON.parse(response.body, symbolize_names: true)

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

    response_body = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(404)
    expect(response_body[:error]).to eq("No email provided")
  end

  it 'rejects mismatched password' do
    header = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
    body = {
            "email": "jim@mail.com",
            "password": "password",
            "password_confirmation": "bad password"
            }

    post '/api/v1/users', headers: header, params: JSON.generate(body)

    response_body = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(404)
    expect(response_body[:error]).to eq("Password does not match password confirmation")
  end

  it 'rejects no provided password' do
    header = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
    body = {
            "email": "jim@mail.com",
            "password": "",
            "password_confirmation": ""
            }

    post '/api/v1/users', headers: header, params: JSON.generate(body)

    response_body = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(404)
    expect(response_body[:error]).to eq("No password provided")
  end

  it 'rejects duplicate emails' do
    User.create(email: "jim@mail.com", password_digest: "scoopy")
    header = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
    body = {
            "email": "jim@mail.com",
            "password": "password",
            "password_confirmation": "password"
            }

    post '/api/v1/users', headers: header, params: JSON.generate(body)

    response_body = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(404)
    expect(response_body[:error]).to eq("Email has already been registered")
  end
end
