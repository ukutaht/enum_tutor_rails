require 'spec_helper'

describe PagesController do
  describe 'GET welcome' do
    context 'not authenticated' do
      it 'renders welcome' do
        controller.stub(:authenticated?).and_return false
        get :welcome

        response.should render_template :welcome
      end
    end

    context 'already authenticated' do
      it 'renders welcome' do
        controller.stub(:authenticated?).and_return true
        get :welcome

        response.should redirect_to challenges_path
      end
    end
  end
end