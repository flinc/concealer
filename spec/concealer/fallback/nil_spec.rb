require 'spec_helper'

describe Concealer::Fallback::Nil do
  describe '#value_for' do
    it "should return nil" do
      subject.value_for(nil, nil, nil).should be_nil
    end
  end
end