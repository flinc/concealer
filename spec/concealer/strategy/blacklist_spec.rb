require 'spec_helper'

describe Concealer::Strategy::Blacklist do

  subject { Concealer::Strategy::Blacklist.new({ ConcealedModel => [:denied_method] }) }

  it "should allow unlisted methods" do
    subject.allow?(ConcealedModel.new, :some_method, nil).should be_true
  end

  it "should allow unlisted methods" do
    subject.allow?(ConcealedModel.new, :denied_method, nil).should be_false
  end

end
