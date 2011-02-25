require 'spec_helper'

describe Concealer do

  subject { ConcealedModel.new }

  describe '.strategy' do

    it "should be Concealer::Strategy::Allow by default" do
      Concealer.strategy.should be_kind_of(Concealer::Strategy::Allow)
    end

  end


  describe '.with_strategy' do

    it "should change the strategy within the block" do
      strategy = Concealer::Strategy::Deny.new
      Concealer.with_strategy(strategy) do
        Concealer.strategy.should be(strategy)
      end
    end

    it "should reset the strategy after the block was executed" do
      strategy = Concealer.strategy
      Concealer.with_strategy(Concealer::Strategy::Deny.new) {}
      Concealer.strategy.should be(strategy)
    end

  end

  describe '.default_fallback' do

    it "should default to Concealer::Fallback::Nil" do
      Concealer.default_fallback.should be_kind_of(Concealer::Fallback::Nil)
    end

  end

  describe '.fallback_for' do

    it "should return the default_fallback if no specific fallback is found" do
      Concealer.fallback_for(ConcealedModel.new, :unknown_method).should be_kind_of(Concealer::Fallback::Nil)
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