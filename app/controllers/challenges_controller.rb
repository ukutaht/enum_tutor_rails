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

  def attempt
    @challenges = Challenge.all
    @challenge = Challenge.find(params[:id])

    current_user.attempts.build(params[:attempt]).tap do |attempt|
      @user_output    = SafeRuby.eval(params[:attempt][:attempt_text])
      expected_output = SafeRuby.eval(@challenge.expected_output)
      attempt.passed  = (expected_output == @user_output)
      attempt.save!
      @attempt = attempt
      @challenge.attempts << attempt
    end

    render 'show'
  end

  private

  def ensure_user_logged_in
    redirect_to root_path unless authenticated?
  end

end
