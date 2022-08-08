require 'rails_helper'

RSpec.describe "Forecast serializer" do
  it 'returns serialized forecast', :vcr do
    coords = {:lat=>39.739154, :lng=>-104.984703}
    @weather = WeatherService.get_weather(coords[:lat], coords[:lng])
    @current = WeatherFacade.get_current_weather(@weather)
    @hourly = WeatherFacade.get_hourly_weather(@weather)
    @daily = WeatherFacade.get_daily_weather(@weather)
    @all_weather = {current: @current, hourly: @hourly, daily: @daily}

    forecast = Api::V1::ForecastSerializer.forecast_index_serializer(@all_weather)

    expect(forecast).to be_a(Hash)
    expect(forecast[:data][:attributes][:current_weather]).to be_a(Hash)
    expect(forecast[:data][:attributes][:daily_weather].count).to eq(5)
    expect(forecast[:data][:attributes][:hourly_weather].count).to eq(8)
  end
end
