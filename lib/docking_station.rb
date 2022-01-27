# frozen_string_literal: true
require_relative '../lib/bike'

class DockingStation
  DEFAULT_CAPACITY = 20

  attr_reader :bikes

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end 

  def release_bike
    raise "No bikes available" unless bikes_available? 
    @bikes.pop
  end

  def dock_bike(bike)
    raise "Docking Station at full capacity." if dock_full?
    @bikes << bike
    @bikes.last
  end

  def see_bike
    @bikes.empty? ? false : true
  end

  private

  def dock_full?
    @bikes.size == @capacity ? true : false
  end

  def bikes_available?
    available_bikes > 0 ? true : false
  end

  def available_bikes
    @bikes.size -  @bikes.filter_map { |bike| bike.working? == false }.count
  end
end
