require 'spec_helper'
describe Challenge do

  describe 'validations' do
    it 'checks initial data' do
      challenge = Challenge.new(FactoryGirl.attributes_for(:challenge_with_invalid_intial_data))
      challenge.should_not be_valid
    end

    it 'checks initial data' do
      challenge = Challenge.new(FactoryGirl.attributes_for(:challenge_with_invalid_expected_output))
      challenge.should_not be_valid
    end
  end

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

  describe 'passed percentage' do
    context 'no passed attempts' do
      it 'is zero' do
        challenge = FactoryGirl.create(:map_challenge)
        challenge.attempts.create(attempt_text: "whatever", passed: false)
        challenge.attempts.create(attempt_text: "heyoo", passed: false)
        challenge.passed_percentage.should be_zero
      end
    end

    context 'some passed attempts' do
      it 'return correct percentage' do
        challenge = FactoryGirl.create(:map_challenge)
        challenge.attempts.create(attempt_text: "whatever", passed: true)
        challenge.attempts.create(attempt_text: "heyoo", passed: false)
        challenge.passed_percentage.should eq 50
      end
    end

    context 'all passed attempts' do
      it 'is 100' do
        challenge = FactoryGirl.create(:map_challenge)
        challenge.attempts.create(attempt_text: "whatever", passed: true)
        challenge.attempts.create(attempt_text: "heyoo", passed: true)
        challenge.passed_percentage.should eq 100
      end
    end
  end
end