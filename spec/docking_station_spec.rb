# frozen_string_literal: true

require_relative '../lib/docking_station'

describe DockingStation do
  let(:bike) { double(:bike, :working? => true) }

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

    it "raises an error if there is only 1 bike and it is not working" do
      allow(bike).to receive(:report_broken)
      allow(bike).to receive(:working?).and_return(false)

      bike.report_broken
      subject.dock_bike(bike)
      expect { subject.release_bike }.to raise_error("No bikes available")
    end

    it "releases the bike that is working when there are 2 bikes and one of them is broken" do
      allow(bike).to receive(:report_broken)

      working_bike = bike
      subject.dock_bike(working_bike)

      broken_bike = bike
      broken_bike.report_broken
      subject.dock_bike(broken_bike)

      expect(subject.release_bike).to be_working
    end

    it "releases a bike that is working when there are 4 bikes, 2 of which are broken" do
      allow(bike).to receive(:report_broken)

      subject { described_class.new(4) }
     
      2.times {subject.dock_bike(bike)}
  
      2.times do 
        broken_bike = bike
        broken_bike.report_broken
        subject.dock_bike(broken_bike)
      end

      expect(subject.release_bike).to be_working
    end

  end

  describe '#dock_bike' do
    it { should respond_to(:dock_bike)}

    it "accepts a bike" do
      expect(subject).to respond_to(:dock_bike).with(1).argument
    end 

    it "docks a bike" do
      expect(subject.dock_bike(bike)).to be(bike)
    end 

    it "raises an error when docking station is full with specified capacity of 10" do
      station = described_class.new(10)
      10.times {station.dock_bike(bike)}
      expect{station.dock_bike(bike)}.to raise_error("Docking Station at full capacity.")
    end
  end 
  
  describe "#see_bike" do
    it { should respond_to(:see_bike)}

    it "returns true if there are bikes in the docking station" do
      subject.dock_bike(bike)
      expect(subject.see_bike).to be true
    end
    
    it "returns false if there are no bikes in the docking station" do
      expect(subject.see_bike).to be false
    end 
  end 

end
