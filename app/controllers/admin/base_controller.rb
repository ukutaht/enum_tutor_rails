class Admin::BaseController < ApplicationController
  before_filter :ensure_admin_user
  # skip_before_filter :ensure_admin_user, :only => [:new]

  private

  def require_admin
    # make sure there is a logged in admin user
  end
end
