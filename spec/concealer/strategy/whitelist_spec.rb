require 'spec_helper'

describe Concealer::Strategy::Whitelist do

  subject { Concealer::Strategy::Whitelist.new({ ConcealedModel => [:allowed_method] }) }

  it "should deny unlisted methods" do
    subject.allow?(ConcealedModel.new, :some_method, nil).should be_false
  end

  it "should deny unlisted methods" do
    subject.allow?(ConcealedModel.new, :allowed_method, nil).should be_true
  end

end