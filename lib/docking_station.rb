# frozen_string_literal: true
require_relative '../lib/bike'

class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
    @capacity = 20
  end 

  def release_bike

    raise "No bikes available" if @bikes.empty?

    @bikes.pop

  end

  def dock_bike(bike)
    raise "Docking Station at full capacity." if @bikes.size == @capacity
    @bikes << bike
    @bikes.last
  end

  def see_bike
    @bikes.empty? ? false : true
  end
end
