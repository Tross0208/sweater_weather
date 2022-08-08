class HourlyWeather
  attr_reader :time, :temperature, :conditions, :icon

  def initialize(hourly_weather)
    @time = Time.at(hourly_weather[:dt]).strftime("%H:%M:%S")
    @temperature = ((hourly_weather[:temp]-273)*1.8+32).round
    @conditions = hourly_weather[:weather].first[:description]
    @icon = hourly_weather[:weather].first[:icon]
  end

end
