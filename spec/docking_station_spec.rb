# frozen_string_literal: true

require_relative '../lib/docking_station'


describe DockingStation do
  let(:bike) { Bike.new }

  describe 'initialization' do
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.dock_bike(bike)
      end
      expect{ subject.dock_bike(bike) }.to raise_error 'Docking Station at full capacity.'
    end
  end

  describe '#release_bike' do

    it { should respond_to :release_bike }

    it "releases a bike that is working" do
      subject.dock_bike(bike)
      bike = subject.release_bike
      expect(bike).to be_working
    end
    
    it "raised an error if no bike is available" do
      expect { subject.release_bike }.to raise_error("No bikes available")
    end

    it "should raise an error if there is only 1 bike and it is not working" do
      bike.report_broken
      subject.dock_bike(bike)
      expect { subject.release_bike }.to raise_error("No bikes available")
    end

    it "should release the bike that is working when there are 2 bikes and one of them is broken" do
      working_bike = Bike.new
      subject.dock_bike(working_bike)
      broken_bike = Bike.new
      broken_bike.report_broken
      subject.dock_bike(broken_bike)
      expect(subject.release_bike).to be_working
    end

    it "should release the bike that is working when there are 4 bikes, 2 of which are broken" do
      subject { described_class.new(4) }
     
      2.times {subject.dock_bike(bike)}
  
      broken_bike_one = Bike.new
      broken_bike_two = Bike.new
      broken_bike_one.report_broken
      broken_bike_two.report_broken

      subject.dock_bike(broken_bike_one)
      subject.dock_bike(broken_bike_two)
      
      expect(subject.release_bike).to be_working
    end

  end

  describe '#dock_bike' do
    it { should respond_to(:dock_bike)}

    it "should accept a bike" do
      expect(subject).to respond_to(:dock_bike).with(1).argument
    end 

    it "should dock a bike" do
      expect(subject.dock_bike(bike)).to be(bike)
    end 

    it "should raise an error when docking station is full with specified capacity of 10" do
      station = described_class.new(10)
      10.times {station.dock_bike(bike)}
      expect{station.dock_bike(bike)}.to raise_error("Docking Station at full capacity.")
    end

  end 
  
  describe "#see_bike" do
    it { should respond_to(:see_bike)}

    it "should return true if there are bikes in the docking station" do
      subject.dock_bike(bike)
      expect(subject.see_bike).to be true
    end
    
    it "should return false if there are no bikes in the docking station" do
      expect(subject.see_bike).to be false
    end 
  end 

end
