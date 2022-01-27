# frozen_string_literal: true

require_relative '../lib/docking_station'


describe DockingStation do
  describe '#release_bike' do

    it { should respond_to :release_bike }

    it "releases a bike that is working" do
      subject.dock_bike(Bike.new)
      bike = subject.release_bike
      expect(bike).to be_working
    end
    
    it "raised an error if no bike is available" do
      expect { subject.release_bike }.to raise_error("No bikes available")
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

    it "raised an error when the docking station is full" do
      DockingStation::DEFAULT_CAPACITY.times { subject.dock_bike(Bike.new) }
      expect{subject.dock_bike(Bike.new)}.to raise_error("Docking Station at full capacity.")
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
