require 'spec_helper'

describe Concealer::Fallback::Paperclip do
  describe '#call' do
    it "should return a paperclip attachment" do
      ConcealedModel.stub(:attachment_definitions).and_return({ :avatar => { :something => true } })
      Paperclip::Attachment.should_receive(:new).with(:avatar, anything, :something => true).and_return(:paperclip)
      subject.call(ConcealedModel.new, :avatar, nil).should eq(:paperclip)
    end
  end
end
