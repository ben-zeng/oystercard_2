class JourneyLog

  attr_reader :journey, :all_journeys

  def initialize
    @all_journeys = []
    @journey = []
  end

  def start(journey)
    @journey[0] = journey
  end

  def finish(exit_station)
    @journey[1] = exit_station
  end

  def journeys
    @all_journeys
  end

  private

  def current_journey
    @journey
  end

end


#@journey_1 = Journey.new(station)
#@journey_list << { :entry => station, :exit => nil }