# frozen_string_literal: true
require_relative '../lib/bike'

class DockingStation
  def release_bike
    return Bike.new
  end
end
