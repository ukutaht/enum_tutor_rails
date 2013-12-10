require 'spec_helper'
describe Challenge do
  describe 'init order' do
    it 'initializes order based on id by default' do
      challenge = FactoryGirl.create(:map_challenge)
      challenge.challenge_order.should eq challenge.id
    end
  end
end