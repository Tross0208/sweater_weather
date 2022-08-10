require 'rails_helper'

RSpec.describe "Forecast API Request" do
  it 'returns serialized forecast', :vcr do
    get "/api/v1/forecast?location=denver,co"
    response_body = JSON.parse(response.body, symbolize_names: true)
    
    expect(response.status).to eq(200)
    expect(response_body[:data][:attributes][:daily_weather].count).to eq(5)
    expect(response_body[:data][:attributes][:hourly_weather].count).to eq(8)
  end

  it 'rejects requests without location' do
    response = get "/api/v1/forecast"
    expect(response).to eq(404)
  end
end
