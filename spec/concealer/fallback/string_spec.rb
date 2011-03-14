require 'spec_helper'

describe Concealer::Fallback::String do
  describe '#call' do
    it "should return an empty string" do
      subject.call(nil, nil, nil).should eq("")
    end

    it "should return the string given on initialization" do
      Concealer::Fallback::String.new("some string").call(nil, nil, nil).should eq("some string")
    end
  end
end
