require 'spec_helper'

describe ChallengesController do
  before do
    controller.stub(:current_user).and_return(FactoryGirl.create(:user))
    @challenge = FactoryGirl.create(:map_challenge)
  end

  describe 'GET index' do
    before { get :index }

    it 'assigns all challenges' do
      assigns(:challenges).should include(@challenge)
    end

    it 'renders the index page' do
      response.should render_template :index
    end
  end

  describe 'GET show' do
    before { get :show, id: @challenge.id }

    it 'assings all challenges' do
      assigns(:challenges).should include(@challenge)
    end

    it 'assigns current challenge' do
      assigns(:challenge).should eq @challenge
    end
  end


  describe 'POST attempt' do
    before do
      SafeRuby.stub(:eval)
      post :attempt, id: @challenge.id, attempt: FactoryGirl.attributes_for(:attempt)
    end

    it 'assings all challenges' do
      assigns(:challenges).should include(@challenge)
    end

    it 'assigns current challenge' do
      assigns(:challenge).should eq @challenge
    end

    it 'creates attempt' do
      expect{ post :attempt, id: @challenge.id, attempt: FactoryGirl.attributes_for(:attempt) }.to \
       change { Attempt.count }.by(1)
    end

    it 'associates attempt with challenge' do
      expect{ post :attempt, id: @challenge.id, attempt: FactoryGirl.attributes_for(:attempt) }.to \
       change { @challenge.attempts.count }.by(1)
    end

    it 'renders show' do
      response.should render_template(:show)
    end

    context 'good attempt' do
      before do
        attempt = FactoryGirl.attributes_for(:attempt)
        SafeRuby.should_receive(:eval).with(attempt[:attempt_text]).and_return([2,3,4])
        SafeRuby.should_receive(:eval).with(@challenge.expected_output).and_return([2,3,4])
        post :attempt, id: @challenge.id, attempt: attempt
      end

      it 'sets attempt#passed to true' do
        assigns(:attempt).passed.should be_true
      end
    end

    context 'bad attempt' do
      before do
        attempt = FactoryGirl.attributes_for(:attempt)
        SafeRuby.should_receive(:eval).with(attempt[:attempt_text]).and_return([1,2,3])
        SafeRuby.should_receive(:eval).with(@challenge.expected_output).and_return([2,3,4])
        post :attempt, id: @challenge.id, attempt: attempt
      end

      it 'sets attempt#passed to false' do
        assigns(:attempt).passed.should be_false
      end
    end
  end
end