require 'spec_helper'

describe Admin::BaseController do
  before do
    ENV['ADMIN_PASSWORD'] = "123456"
  end

  describe 'GET new_admin_session' do
    before { get :new_admin_session }

    it 'should render admin login page' do
      response.should render_template :new_admin_session
    end
  end

  describe 'POST create_admin_session' do
    context 'correct password' do
      before { post :create_admin_session, password: '123456' }
      it 'should create admin session' do
        session['admin'].should be_true
      end
    end

    context 'incorrect password' do
      before { post :create_admin_session, password: 'lolzor' }
      it 'should create admin session' do
        session['admin'].should be_false
      end
    end
  end
end