require 'spec_helper'

describe Concealer::Fallback do
  describe '#value_for' do
    it "should raise an exception when called directly" do
      expect { subject.value_for(nil, nil, nil) }.to raise_error /must implement/
    end
  end
end