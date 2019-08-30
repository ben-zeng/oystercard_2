require 'oystercard'

describe Oystercard do

  let(:station){double :station}
  let(:station2){double :station}

  describe 'card balance' do

    it 'will start with a balance of 0' do
      expect(subject.balance).to eq 0
    end

    it 'will increase balance with top up' do
      expect(subject.top_up(5)).to eq 5
    end

    it 'will raise error if maximum balance is exceeded' do
      maximum_balance = Oystercard::MAXIMUM_BALANCE
      subject.top_up(maximum_balance)
      expect { subject.top_up 1 }.to raise_error "Maximum balance of #{maximum_balance} exceeded"
    end
  end


  describe 'journey' do

    it { is_expected.to respond_to(:touch_in) }
    it { is_expected.to respond_to(:touch_out) }

    it 'raises error if balance is below minimum on touch in' do
      expect {subject.touch_in(station)}.to raise_error "Insufficient funds for journey"
    end


    it 'charges fare amount during touch out' do
      subject.top_up(Oystercard::MAXIMUM_BALANCE)
      subject.touch_in(station)
      expect{ subject.touch_out(station) }.to change{ subject.balance }.by(-Oystercard::MINIMUM_FARE)
    end
  end

  context "fare between zones" do
    let(:station1) { Station.new(1, "station1")}
    let(:station5) { Station.new(5, "station5")}

    it "calculates the fare between zones" do
      subject.top_up(20)
      subject.touch_in(station1)
      subject.touch_out(station5)
      expect(subject.balance).to eq(15)
    end
  end

end
