# frozen_string_literal: true

require_relative '../lib/docking_station'


describe DockingStation do
  describe '#release_bike' do

    it { should respond_to(:release_bike) }

    # we want to write a test that gets a bike and expects the bike to be working
    it "releases a bike that is working" do
      bike = subject.release_bike
      expect(bike).to be_working
    end
  end

  describe '#dock_bike' do
    it { should respond_to(:dock_bike)}

    it "should accept a bike" do
      expect(subject).to respond_to(:dock_bike).with(1).argument
    end 

    it "should dock a bike" do
      bike = Bike.new
      expect(subject.dock_bike(bike)).to be(bike)
    end 
  end 
  
  describe "#see_bike" do
    it { should respond_to(:see_bike)}

    it "should return true if there are bikes in the docking station" do
      bike = Bike.new
      subject.dock_bike(bike)
      expect(subject.see_bike).to be true
    end
    
    it "should return false if there are no bikes in the docking station" do
      expect(subject.see_bike).to be false
    end 
  end 
end
