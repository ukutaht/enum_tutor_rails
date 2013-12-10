class PagesController < ApplicationController
  include SessionsHelper

  def welcome
    redirect_to challenges_path if authenticated?
  end
end
