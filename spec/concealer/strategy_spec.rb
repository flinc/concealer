require 'spec_helper'

describe Concealer::Strategy do
  it "should raise an exception when called directly" do
    expect { subject.allow?(nil, nil, nil) }.to raise_error /must implement/
  end
end