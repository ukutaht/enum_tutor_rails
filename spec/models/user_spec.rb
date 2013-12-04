require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.create(:user) }
  let(:map_challenge) { FactoryGirl.create(:map_challenge) }
  let(:select_challenge) { FactoryGirl.create(:select_challenge) }

  describe '#completed?' do
    context 'has not completed yet' do
      it 'returns false' do
        user.completed?(map_challenge).should be_false
      end
    end

    context 'has completed' do
      let(:attempt) { FactoryGirl.create(:attempt, passed: true) }
      it 'returns true' do
        user.attempts << attempt
        map_challenge.attempts << attempt
        user.completed?(map_challenge).should be_true
      end
    end
  end

  describe '#progress' do
    before { Challenge.stub(:all).and_return([1,2,3,4,5]) }
    it 'returns 0 when no completed challenges' do
      user.stub(:completed_challenges).and_return([])
      user.progress.should eq 0
    end

    it 'returns 40 when 2 completed challenges' do
      user.stub(:completed_challenges).and_return([1,2])
      user.progress.should eq 40
    end

    it 'returns 100 when 5 completed challenges' do
      user.stub(:completed_challenges).and_return([1,2,3,4,5])
      user.progress.should eq 100
    end
  end

  describe '#attempts_for' do
    let(:attempt) { FactoryGirl.create(:attempt, passed: true) }
    it 'returns array of attempts when there are some' do
      user.attempts << attempt
      map_challenge.attempts << attempt

      user.attempts_for(map_challenge.id).should include(attempt)
    end

    it 'returns empty array when there are none' do
      user.attempts_for(map_challenge.id).should be_empty
    end
  end
end
