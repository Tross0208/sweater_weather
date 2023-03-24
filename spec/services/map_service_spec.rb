require 'rails_helper'

RSpec.describe "Map service" do

  it "gets location latitude and longitude", :vcr do
    json = MapService.get_coords("Denver,CO")

    expect(json[:results].first[:locations].first[:latLng]).to have_key(:lat)
    expect(json[:results].first[:locations].first[:latLng][:lat]).to eq(39.74001)
  end

end
