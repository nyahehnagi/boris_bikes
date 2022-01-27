# frozen_string_literal: true
require_relative '../lib/bike'

class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
  end 

  def release_bike
    
    if @bikes.empty?
      raise "No bikes available"
    else
      return Bike.new
    end
  end

  def dock_bike(bike)
    @bikes << bike
    @bikes.last
  end

  def see_bike
    @bikes.empty? ? false : true
  end
end
