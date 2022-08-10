class DailyWeather
  attr_reader :date, :sunrise, :sunset, :max_temperature, :min_temperature, :conditions, :icon, :temperature

  def initialize(current_weather)
    @date = Time.at(current_weather[:dt]).strftime("%m/%d/%Y")
    @sunrise = Time.at(current_weather[:sunrise])
    @sunset = Time.at(current_weather[:sunset])
    @max_temperature = ((current_weather[:temp][:max]-273)*1.8+32).round
    @min_temperature = ((current_weather[:temp][:min]-273)*1.8+32).round
    @conditions = current_weather[:weather].first[:description]
    @icon = current_weather[:weather].first[:icon]
    @temperature = @max_temperature
  end
end
