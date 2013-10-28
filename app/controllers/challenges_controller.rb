class ChallengesController < ApplicationController
  include SessionsHelper
  
  before_filter :ensure_user_logged_in

  def index
    @challenges = Challenge.all 
  end

  def show
    @challenges = Challenge.all
    @challenge = Challenge.find(params[:id])
  end

  private

  def ensure_user_logged_in
    redirect_to root_path unless authenticated?
  end

end
