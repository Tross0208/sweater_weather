class Roadtrip
  attr_reader :travel_time, :origin, :destination
  attr_accessor :travel_time

  def initialize(route, origin, destination)

    @travel_time = route[:route][:formattedTime]
    @origin = origin
    @destination = destination
  end

  def time_to_hours
    h, m, s = @travel_time.split(":").map(&:to_f)
    hours = h + (m * 0.0166)
  end
end
