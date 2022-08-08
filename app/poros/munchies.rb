class Munchies
  attr_reader :name, :address, :city

  def initialize(restaurant)
    @name = restaurant[:name]
    @address = "#{restaurant[:location][:display_address].first}, #{restaurant[:location][:display_address].last}"
    @city = "#{restaurant[:location][:city]}, #{restaurant[:location][:state]}"
  end
end
