require 'rails_helper'

RSpec.describe "Hourly Weather PORO" do
  it 'creates hourly weather poro from json' do
    json = {:dt=>1659938400,
           :temp=>290.63,
           :feels_like=>290.63,
           :pressure=>1019,
           :humidity=>84,
           :dew_point=>287.9,
           :uvi=>0,
           :clouds=>100,
           :visibility=>10000,
           :wind_speed=>3.26,
           :wind_deg=>228,
           :wind_gust=>4.79,
           :weather=>[{:id=>804, :main=>"Clouds", :description=>"overcast clouds", :icon=>"04n"}],
           :pop=>0.8}

    @hourly = HourlyWeather.new(json)

    expect(@hourly.temperature).to eq(64)
    expect(@hourly.time).to eq("01:00:00")
    expect(@hourly.icon).to eq("04n")
    expect(@hourly.conditions).to eq("overcast clouds")
  end
end
