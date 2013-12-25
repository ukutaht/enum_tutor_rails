require 'spec_helper'

describe Admin::ChallengesController do
  before do
    session['admin'] = true
    @challenge = FactoryGirl.create(:map_challenge)
  end

  describe 'index' do
    before { get :index }

    it 'assigns all challenges' do
      assigns(:challenges).should include(@challenge)
    end

    it 'renders index' do
      response.should render_template :index
    end
  end

  describe 'new' do
    before { get :new }

    it 'assigns new challenge' do
      assigns(:challenge).should be_a Challenge
    end

    it 'assigns new doc' do
      assigns(:challenge).doc.should be_a Doc
    end

    it 'renders form' do
      response.should render_template(:form)
    end
  end

  describe 'create' do
    before { RubyDocScraper.stub(:find_html).and_return("lalala") }
    context 'with valid attributes' do
      it 'creates a challenge' do
        expect{ post :create, challenge: FactoryGirl.attributes_for(:map_challenge), doc: { method: "map" } }.to \
          change{ Challenge.count }.by(1)
      end

      it 'redirects to admin_challenges_path' do
        post :create, challenge: FactoryGirl.attributes_for(:map_challenge), doc: { method: "map" }
        response.should redirect_to(admin_challenges_path)
      end
    end

    context 'with invalid attributes' do
      it 'does not create a challenge' do
        expect{ post :create, challenge: FactoryGirl.attributes_for(:challenge_with_invalid_intial_data), doc: { method: "map" } }.to_not \
          change{ Challenge.count }
      end

      it 'redirects to admin_challenges_path' do
        post :create, challenge: FactoryGirl.attributes_for(:challenge_with_invalid_intial_data), doc: { method: "map" }
        response.should render_template('form')
      end
    end
  end

  describe 'edit' do
    before do
      @challenge = FactoryGirl.create(:map_challenge)
      get :edit, id: @challenge.id
    end

    it 'assigns current challenge' do
      assigns(:challenge).should eq @challenge
    end

    it 'renders form' do
      response.should render_template('form')
    end
  end
end