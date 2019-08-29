require 'journey'

describe Journey do

  let (:journey_1) { Journey.new('Holborn') }
  let (:journey_2) { Journey.new(nil) }
  let (:exit_station) { double :exit_station }

  describe '#initialize' do
    it 'takes entry station as a parameter' do
      expect(journey_1.entry_station).to eq('Holborn')
    end 
  end 

  describe '#exit' do
    it 'takes exit station as a parameter' do
      journey_1.exit(exit_station)
      expect(journey_1.exit_station).to eq(exit_station)
    end 
  end 

  describe '#calculate_fare' do
    it 'outputs minimum fare for complete journey' do
      journey_1.exit(exit_station)
      expect(journey_1.calculate_fare).to eq(1)
    end

    it 'outputs penalty fare with no touch out' do
      expect(journey_1.calculate_fare).to eq(6)
    end

    it 'outputs penalty fare with no touch in' do
      journey_2.exit(exit_station)
      expect(journey_2.calculate_fare).to eq(6)
    end
  end
end 
