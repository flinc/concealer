require 'spec_helper'

describe Concealer::Fallback::Paperclip do
  describe '#value_for' do
    it "should return an empty string" do
      ConcealedModel.stub!(:attachment_definitions).and_return({ :avatar => :something })
      Paperclip::Attachment.should_receive(:new).with(:avatar, anything, :something).and_return(:paperclip)
      subject.value_for(ConcealedModel.new, :avatar, nil).should eq(:paperclip)
    end
  end
end