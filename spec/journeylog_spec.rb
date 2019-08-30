require 'journeylog'

describe JourneyLog do
 #let (:journey1) {Journey.new("algate")}
  #let (:journey_log) { JourneyLog.new(journey1)}
  let (:exit_station) { double :exit_station }

  describe '#initialize' do

  end

  describe '#start' do
    it 'should start a new journey with an entry station' do
      subject.start("algate")
      expect(subject.journey[0]).to eq("algate")
    end
  end

  describe "#finish" do
    it "add an exit station to the current journey" do
      subject.start("algate")
      subject.finish(exit_station)
      expect(subject.journey[1]).to eq(exit_station)
    end
  end

end

