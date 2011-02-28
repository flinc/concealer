require 'spec_helper'

describe Concealer::Strategy::Deny do
  it "should deny everything" do
    subject.allow?(nil, nil, nil).should be_false
  end
end
