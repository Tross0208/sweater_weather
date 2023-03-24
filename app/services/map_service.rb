class MapService
  def self.get_route(origin, destination)
    response = conn.get("/directions/v2/route?from=#{origin}&to=#{destination}")
    get_json(response)
  end

  def self.get_coords(location)
    
    response = conn.get("/geocoding/v1/address?&location=#{location}")
    get_json(response)
  end

  def self.get_json(response)
   JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new('https://www.mapquestapi.com') do |faraday|
      faraday.params['key'] = ENV['map_api_key']
    end
  end
end
