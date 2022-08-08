require 'rails_helper'

RSpec.describe "Weather Facade" do
  before :each do
    coords = {:lat=>39.739154, :lng=>-104.984703}
    @weather = WeatherService.get_weather(coords[:lat], coords[:lng])
    @current = WeatherFacade.get_current_weather(@weather)
    @hourly = WeatherFacade.get_hourly_weather(@weather)
    @daily = WeatherFacade.get_daily_weather(@weather)
    @all_weather = {current: @current, hourly: @hourly, daily: @daily}
  end

  it 'gets current weather', :vcr do
    expect(@current.temperature).to be_an(Integer)
    expect(@current.sunrise).to be_a(Time)
    expect(@current.sunset).to be_a(Time)
    expect(@current.datetime).to be_a(Time)
    expect(@current.icon).to be_a(String)
    expect(@current.conditions).to be_a(String)
    expect(@current.visibility).to be_an(Integer)
    expect(@current.humidity).to be_an(Integer)
    expect(@current.uvi).to be_an(Integer)
  end

  it 'gets daily weather', :vcr do
    first_day = @daily.first

    expect(@daily.count).to eq(5)
    expect(first_day.max_temperature).to be_an(Integer)
    expect(first_day.min_temperature).to be_an(Integer)
    expect(first_day.sunrise).to be_a(Time)
    expect(first_day.sunset).to be_a(Time)
    expect(first_day.icon).to be_a(String)
    expect(first_day.conditions).to be_a(String)
  end

  it 'gets hourly weather', :vcr do
    first_hour = @hourly.first

    expect(@hourly.count).to eq(8)
    expect(first_hour.temperature).to be_an(Integer)
    expect(first_hour.time).to be_a(String)
    expect(first_hour.icon).to be_a(String)
    expect(first_hour.conditions).to be_a(String)
  end
end
