require 'spec_helper'

describe Concealer::Fallback::EmptyString do
  describe '#value_for' do
    it "should return an empty string" do
      subject.value_for(nil, nil, nil).should eq("")
    end
  end
end