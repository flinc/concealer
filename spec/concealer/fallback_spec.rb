require 'spec_helper'

describe Concealer::Fallback do
  describe '#call' do
    it "should raise an exception when called directly" do
      expect { subject.call(nil, nil, nil) }.to raise_error /must implement/
    end
  end
end