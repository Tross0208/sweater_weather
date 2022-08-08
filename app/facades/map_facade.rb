class MapFacade
  def self.get_coords(location)
    data = MapService.get_coords(location)
    return data[:results].first[:locations].first[:latLng]
  end
end
