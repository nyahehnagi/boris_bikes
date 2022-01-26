# frozen_string_literal: true
require_relative '../lib/bike'

class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
  end 

  def release_bike
    return Bike.new
  end

  def dock_bike(bike)
    @bikes << bike
  end

  def see_bike
    @bikes.empty? ? false : true
  end
end
