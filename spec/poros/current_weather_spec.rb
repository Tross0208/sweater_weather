require 'rails_helper'

RSpec.describe "Current Weather PORO" do
  it 'creates current weather poro from json' do
    json = {:dt=>1655277090,
      :sunrise=>1655292686,
      :sunset=>1655346574,
      :temp=>286.32,
      :feels_like=>285.13,
      :pressure=>1007,
      :humidity=>55,
      :dew_point=>277.49,
      :uvi=>0,
      :clouds=>0,
      :visibility=>10000,
      :wind_speed=>0.89,
      :wind_deg=>59,
      :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01n"}]}

      @current = CurrentWeather.new(json)

      expect(@current.temperature).to eq(56)
      expect(@current.feels_like).to eq(54)
      expect(@current.sunrise).to eq("2022-06-15 06:31:26 -0500")
      expect(@current.sunset).to eq("2022-06-15 21:29:34 -0500")
      expect(@current.datetime).to eq("2022-06-15 02:11:30 -0500")
      expect(@current.icon).to eq("01n")
      expect(@current.conditions).to eq("clear sky")
      expect(@current.visibility).to eq(10000)
      expect(@current.humidity).to eq(55)
      expect(@current.uvi).to eq(0)
  end
end
