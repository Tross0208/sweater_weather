require 'rails_helper'

RSpec.describe "Weather service" do

  it "gets weather forecast", :vcr do
    json = WeatherService.get_weather(39.73, -104.99)

    expect(json).to have_key(:lat)
    expect(json[:lat]).to eq(39.73)
  end

end
