# frozen_string_literal: true

require_relative '../lib/bike'

describe Bike do
  it { is_expected.to respond_to(:working?) }
  it { is_expected.to respond_to(:report_broken) }

  describe "#initialisation" do
    it "should be working?" do
      expect(subject).to be_working
    end
  end

  describe "#report_broken" do
    it "should update working? to false if bike is broken" do
      subject.report_broken
      expect(subject.working?).to be false
    end
  end
end
