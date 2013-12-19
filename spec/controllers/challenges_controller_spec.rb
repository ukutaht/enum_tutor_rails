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
end