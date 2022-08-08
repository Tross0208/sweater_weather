require 'rails_helper'

RSpec.describe "Daily Weather PORO" do
  it 'creates daily weather poro from json' do
    json = {:dt=>1659985200,
            :sunrise=>1659960332,
            :sunset=>1660010740,
            :moonrise=>1660002300,
            :moonset=>1659944760,
            :moon_phase=>0.37,
            :temp=>{:day=>302.57, :min=>290.63, :max=>304.75, :night=>298.13, :eve=>301.87, :morn=>292.31},
            :feels_like=>{:day=>301.59, :night=>297.91, :eve=>301.03, :morn=>292.11},
            :pressure=>1014,
            :humidity=>33,
            :dew_point=>284.59,
            :wind_speed=>5.5,
            :wind_deg=>146,
            :wind_gust=>9.24,
            :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}],
            :clouds=>0,
            :pop=>0.8,
            :uvi=>10.24}

      @daily = DailyWeather.new(json)

      expect(@daily.max_temperature).to eq(89)
      expect(@daily.min_temperature).to eq(64)
      expect(@daily.date).to eq("08/08/2022")
      expect(@daily.sunrise).to eq("2022-08-08 07:05:32 -0500")
      expect(@daily.sunset).to eq("2022-08-08 21:05:40 -0500")
      expect(@daily.icon).to eq("01d")
      expect(@daily.conditions).to eq("clear sky")
  end
end
