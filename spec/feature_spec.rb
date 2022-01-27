require './lib/docking_station.rb'

station = DockingStation.new
puts "Docking Station ID #{station}"
puts "Docking Capacity #{DockingStation::DEFAULT_CAPACITY}"

bike = station.dock_bike(Bike.new)
puts "Bike added to Docking Station #{bike}"
bike = station.release_bike
puts "Bike that has been released #{bike}"

puts "Is the bike working? #{bike.working?}"

20.times { station.dock_bike(Bike.new) }

begin
  station.dock_bike(Bike.new)
rescue => exception
  puts "Exception test: #{exception}"
end


