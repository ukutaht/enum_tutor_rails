require 'spec_helper'

describe SessionsHelper do
  describe '#current_user' do
    before do
      @user = FactoryGirl.create(:user)
      session[:user_socrates_id] = @user.socrates_id
    end

    it 'fetches current user based on session' do
      current_user.should eq @user
    end

    it 'memoizes current_user' do
      current_user
      User.should_not_receive(:find_by_socrates_id)
      current_user
    end
  end
end