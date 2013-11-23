class Admin::BaseController < ApplicationController
  before_filter :ensure_admin_user
  skip_before_filter :ensure_admin_user, only: [:new_admin_session, :create_admin_session]

  def new_admin_session
  end

  def create_admin_session
    if params[:password] == ENV['ADMIN_PASSWORD']
      session[:admin] = true
    end

    redirect_to admin_challenges_path
  end


  protected

  def ensure_admin_user
    redirect_to root_path unless session[:admin] == true
  end
end
