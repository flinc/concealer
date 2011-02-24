require 'spec_helper'

describe Concealer::Strategy::MultiLevel do

  let(:levels) { [:myself, :friends, :friends_of_friends, :everyone] }

  let(:current_user) { User.new("benedikt") }
  let(:other_user) { User.new("christian") }

  subject { Concealer::Strategy::MultiLevel.new(current_user, levels) }

  context 'required level higher than actual level' do
    before(:each) do
      subject.stub!(:required_level_for).and_return(:myself)
    end

    it "should deny the call" do
      subject.allow?(other_user, :name, nil).should be_false
    end
  end

  context 'required level lower than actual level' do
    before(:each) do
      subject.stub!(:required_level_for).and_return(:friends_of_friends)
    end

    it "should allow the call" do
      subject.allow?(other_user, :name, nil).should be_true
    end
  end

  context 'required level equals actual level' do
    before(:each) do
      subject.stub!(:required_level_for).and_return(:friends)
    end

    it "should allow the call" do
      subject.allow?(other_user, :name, nil).should be_true
    end
  end
end