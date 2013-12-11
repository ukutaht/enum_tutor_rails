require 'spec_helper'
describe Challenge do
  describe 'init order' do
    it 'initializes order based on id by default' do
      challenge = FactoryGirl.create(:map_challenge)
      challenge.challenge_order.should eq challenge.id
    end

    it 'allows custom order' do
      challenge = FactoryGirl.create(:map_challenge, :challenge_order => 4)
      challenge.challenge_order.should eq 4
    end
  end
end