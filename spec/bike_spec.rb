# frozen_string_literal: true

require_relative '../lib/bike'

describe Bike do
  it { is_expected.to respond_to(:working?) }
end
