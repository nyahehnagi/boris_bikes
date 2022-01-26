# frozen_string_literal: true

require_relative '../lib/docking_station'


describe DockingStation do
  describe '#release_bike' do

    it { should respond_to(:release_bike) }

    # we want to write a test that gets a bike and expects the bike to be working
    it "releases a bike that is working" do
      docking_station = DockingStation.new
      bike = docking_station.release_bike
      expect(bike.working?).to eq true

      #bike = subject.release_bike
      #expect(bike).to be_working

    end
  end
end
