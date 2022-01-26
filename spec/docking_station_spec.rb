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

  describe '#dock_bike' do
    it { should respond_to(:dock_bike)}

    it "should accept a bike" do
      docking_station = DockingStation.new
      expect(docking_station).to respond_to(:dock_bike).with(1).argument
    end 

    it "should dock a bike" do
      docking_station = DockingStation.new
      bike = Bike.new
      docking_station.dock_bike(bike)
      expect(docking_station.bikes).not_to be_empty
    end 
  end 
  
  describe "#see_bike" do
    it { should respond_to(:see_bike)}

    it "should return true if there are bikes in the docking station" do
      docking_station = DockingStation.new
      bike = Bike.new
      docking_station.dock_bike(bike)
      expect(docking_station.see_bike).to eq true
    end
    
    it "should return false if there are no bikes in the docking station" do
      docking_station = DockingStation.new
      expect(docking_station.see_bike).to eq false
    end 
  end 
end
