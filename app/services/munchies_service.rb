class MunchiesService
  def self.get_restuarants(location, food)
    response = conn.get("businesses/search?location=#{location}&categories=#{food}")
    get_json(response)
  end

  def self.get_json(response)
   JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new('https://api.yelp.com/v3/') do |faraday|
      faraday.headers['Authorization'] = ENV['yelp_api_key']
    end
  end
end
