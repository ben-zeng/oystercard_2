require_relative 'journeylog'

class Oystercard

  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(amount)
    fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(station)
    fail "Insufficient funds for journey" if @balance < MINIMUM_FARE
    @journey = JourneyLog.new
    @journey.start(station)
  end

  def touch_out(station)
    @journey.finish(station)
    deduct(@journey.calculate_fare)
  end

  private

  def deduct(fare)
    @balance -= fare
  end
end