require 'rails_helper'

RSpec.describe "Munchies Facade" do

  it 'gets one restaurant poro', :vcr do
    restaurant = MunchiesFacade.get_restaurant("denver, co", "chinese")

    expect(restaurant.name).to be_a(String)
    expect(restaurant.address).to be_a(String)
    expect(restaurant).to be_a(Munchies)
  end
end
