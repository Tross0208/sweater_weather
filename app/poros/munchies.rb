class Munchies
  attr_reader :name, :address

  def initialize(restaurant)
    @name = restaurant[:name]
    @address = restaurant[:display_address]
  end
end
