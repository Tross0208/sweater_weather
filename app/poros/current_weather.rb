class CurrentWeather
  attr_reader :datetime, :sunrise, :sunset, :temperature, :feels_like, :humidity, :uvi, :visibility, :conditions, :icon

  def initialize(current_weather)
    @datetime = Time.at(current_weather[:dt])
    @sunrise = Time.at(current_weather[:sunrise])
    @sunset = Time.at(current_weather[:sunset])
    @temperature = ((current_weather[:temp] -273)*1.8+32).round
    @feels_like = ((current_weather[:feels_like] -273)*1.8+32).round
    @humidity = current_weather[:humidity]
    @uvi = current_weather[:uvi]
    @visibility = current_weather[:visibility]
    @conditions = current_weather[:weather].first[:description]
    @icon = current_weather[:weather].first[:icon]
  end

end
