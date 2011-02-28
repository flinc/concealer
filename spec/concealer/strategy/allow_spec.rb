require 'spec_helper'

describe Concealer::Strategy::Allow do
  it "should allow everything" do
    subject.allow?(nil, nil, nil).should be_true
  end
end
