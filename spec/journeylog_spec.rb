require 'journeylog'

describe JourneyLog do

  let (:entry_station) { double :entry_station }
  let (:exit_station) { double :exit_station }

  describe '#initialize' do

  end

  describe '#start' do
    it 'should start a new journey with an entry station' do
      subject.start(entry_station)
      expect(subject.journey[0]).to eq(entry_station)
    end
  end

  describe "#finish" do
    it "add an exit station to the current journey" do
      subject.start(entry_station)
      subject.finish(exit_station)
      expect(subject.journey[1]).to eq(exit_station)
    end

    it 'will update journey list with complete journey' do
      subject.start(entry_station)
      subject.finish(exit_station)
      expect(subject.journey_list[-1]).to include(entry: entry_station, exit: exit_station)
    end
  end

end

