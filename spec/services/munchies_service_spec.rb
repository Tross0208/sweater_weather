require 'rails_helper'

RSpec.describe "Munchies service" do

  it "gets weather forecast" do
    json = MunchiesService.get_restuarants("denver, co", "chinese")

    expect(json).to have_key(:businesses)
    expect(json[:businesses].count).to eq(20)
  end

end
