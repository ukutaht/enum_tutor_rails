class ChallengesController < ApplicationController
  include SessionsHelper
  include ChallengesHelper
  
  before_filter :ensure_user_logged_in

  def index
    @challenges = Challenge.all 
  end

  def show
    @challenges = Challenge.all
    @challenge = Challenge.find(params[:id])
  end

  def attempt
    
    @challenges = Challenge.all
    @challenge = Challenge.find(params[:id])

    @user_output = evaluate(params[:attempt][:attempt_text])
    params[:attempt][:passed] = @user_output == @challenge.evaluated_output
    @attempt = current_user.attempts.create(params[:attempt])
    @challenge.attempts << @attempt

    render 'show'

  end

  private

  def ensure_user_logged_in
    redirect_to root_path unless authenticated?
  end

end
