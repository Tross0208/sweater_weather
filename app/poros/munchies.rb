class Munchies
  attr_reader :name, :address

  def initialize(restaurant)

    @name = restaurant[:name]
    @address = "#{restaurant[:location][:display_address].first}, #{restaurant[:location][:display_address].last}"
  end
end
