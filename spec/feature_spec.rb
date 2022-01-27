require './lib/docking_station.rb'

station = DockingStation.new
puts "Docking Station ID #{station}"
puts "Docking Capacity #{DockingStation::DEFAULT_CAPACITY}"

bike = station.dock_bike(Bike.new)
puts "Bike added to Docking Station #{bike}"
bike = station.release_bike
puts "Bike that has been released #{bike}"

puts "Is the bike working? #{bike.working?}"

bike = Bike.new
bike.report_broken
puts "is the bike working #{bike.working?}"

puts "Testing broken bike and capacity"
station = DockingStation.new(1)
bike = Bike.new
bike.report_broken
station.dock_bike(bike)

begin
  station.release_bike
rescue => exception
  puts "Exception test release bike at capacity: #{exception}"

end
  
# puts "Testing default capacity"
# DockingStation::DEFAULT_CAPACITY.times { station.dock_bike(Bike.new) }
# station = DockingStation.new(10)
# 10.times { station.dock_bike(Bike.new)}

# begin
#   station.dock_bike(Bike.new)
# rescue => exception
#   puts "Exception test 2: #{exception}"
# end
