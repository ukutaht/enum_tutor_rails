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
      attempt.passed = SafeRuby.check(params[:attempt][:attempt_text], @challenge.expected_output)
      attempt.save!
      @challenge.attempts << attempt
    end

    render 'show'
  end

  private

  def ensure_user_logged_in
    redirect_to root_path unless authenticated?
  end

end
