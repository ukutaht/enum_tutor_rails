require 'spec_helper'

describe SessionsController do
  before { request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:dbc]  }

  describe 'GET sign_in' do
    it 'redirects to omniauth path' do
      get :sign_in

      response.should redirect_to '/auth/dbc'
    end
  end

  describe 'GET sign_out' do
    it 'clears the session' do
      session.should_receive(:clear)

      get :sign_out
    end

    it 'redirects to root' do
      get :sign_out

      response.should redirect_to root_path
    end
  end

  describe 'POST auth' do
    it 'creates a user from omniauth' do
      expect{ post :auth, provider: :dbc }.to change{ User.count }.by(1)
    end

    it 'sets session id' do
      post :auth, provider: :dbc

      session[:user_socrates_id].should eq 12345
    end
  end
end