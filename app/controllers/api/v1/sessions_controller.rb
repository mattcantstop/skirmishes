class Api::V1::SessionsController < ApplicationController

  before_filter :identify_user, :only => :create
  skip_before_filter :current_user, :only => :create

  def create
    if @user && @user.authenticate(params[:password])
      render 'users/show.rabl'
    else
      render_errors(@user)
    end
  end

  private

  def identify_user
    @user ||= User.find_by_username(params[:username])
  end

end
