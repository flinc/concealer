require 'spec_helper'

describe Concealer do

  subject { ConcealedModel.new }

  describe '.strategy' do

    it "should be Concealer::Strategy::Allow by default" do
      Concealer.strategy.should be_kind_of(Concealer::Strategy::Allow)
    end

    it "should return the set stategy" do
      strategy = Concealer::Strategy::Deny.new
      Concealer.strategy = strategy
      Concealer.strategy.should be(strategy)
    end

  end

  describe '#concealed' do

    it "should be defined on the model" do
      should respond_to(:concealed)
    end

    it "should return a proxy object" do
      subject.concealed.should be
    end

  end

end