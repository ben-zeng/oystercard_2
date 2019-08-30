require_relative 'journey'

class JourneyLog

  attr_reader :journey, :journey_list

  def initialize
    @journey_list = []
    @journey = []
  end

  def start(journey)
    @journey_test = Journey.new(journey)
    @journey[0] = journey
  end

  def finish(exit_station)
    @journey_test.exit(exit_station)
    @journey[1] = exit_station
    @journey_list << { entry: @journey[0], exit: @journey[1] }
  end

  def journeys
    @journey_list
  end

  def calculate_fare
    @journey_test.calculate_fare
  end

  private

  def current_journey
    @journey
  end

end
