class MapFacade
  def self.get_coords(location)
    data = MapService.get_coords(location)
    
    if data[:results].first[:locations].first[:adminArea3] == ""
      return "error"
    else
      return data[:results].first[:locations].first[:latLng]
    end
  end

  def self.get_trip(origin, destination)
    route = MapService.get_route(origin, destination)
    trip = Roadtrip.new(route, origin, destination)
  end
end
