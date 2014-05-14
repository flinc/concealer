require 'spec_helper'

describe Concealer::Strategy::Any do

  let(:strategy_1) { double(Concealer::Strategy::Allow.new) }
  let(:strategy_2) { double(Concealer::Strategy::Allow.new) }

  subject { Concealer::Strategy::Any.new(strategy_1, strategy_2) }

  context 'both deny' do
    before(:each) do
      strategy_1.stub(:allow?).and_return(false)
      strategy_2.stub(:allow?).and_return(false)
    end

    it "should deny the call" do
      subject.allow?(nil, nil, nil).should be_false
    end
  end

  context 'both allow' do
    before(:each) do
      strategy_1.stub(:allow?).and_return(true)
      strategy_2.stub(:allow?).and_return(true)
    end

    it "should allow the call" do
      subject.allow?(nil, nil, nil).should be_true
    end
  end

  context 'only one allows' do
    before(:each) do
      strategy_1.stub(:allow?).and_return(true)
      strategy_2.stub(:allow?).and_return(false)
    end

    it "should allow the call" do
      subject.allow?(nil, nil, nil).should be_true
    end
  end
end
