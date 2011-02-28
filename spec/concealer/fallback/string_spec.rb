require 'spec_helper'

describe Concealer::Fallback::String do
  describe '#call' do
    it "should return an empty string" do
      subject.call(nil, nil, nil).should eq("")
    end
  end
end