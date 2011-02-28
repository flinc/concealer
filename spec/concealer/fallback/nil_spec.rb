require 'spec_helper'

describe Concealer::Fallback::Nil do
  describe '#call' do
    it "should return nil" do
      subject.call(nil, nil, nil).should be_nil
    end
  end
end
