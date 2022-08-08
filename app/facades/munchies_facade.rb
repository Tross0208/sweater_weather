class MunchiesFacade
  def self.get_restaurant(location, food)
    data = MunchiesService.get_restaurants(location, food)
    restaurant = Munchies.new(data[:businesses].first)
  end
end
