require './lib/docking_station.rb'

station = DockingStation.new
puts station
bike = station.release_bike
puts bike
bike.working?