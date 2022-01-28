# frozen_string_literal: true
require_relative '../lib/bike'

class DockingStation
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @working_bikes = []
    @broken_bikes = []
    @capacity = capacity
  end 

  def release_bike
    raise "No bikes available" unless bikes_available? 
    @working_bikes.pop
  end

  def dock_bike(bike)
    raise "Docking Station at full capacity." if dock_full?
    bike.working? ? @working_bikes << bike : @broken_bikes << bike
    bike
  end

  def see_bike
    total_bikes > 0 
  end

  private

  def dock_full?
    total_bikes == @capacity
  end

  def total_bikes
    @working_bikes.size + @broken_bikes.size
  end

  def bikes_available?
    @working_bikes.size > 0
  end

end
