class Api::V1::SessionsController < ApplicationController

  before_filter :find_user
  skip_before_filter :current_user, :only => :create

  def create
    if @user && @user.authenticate(params[:password])
      render 'users/show.rabl'
    else
      render_errors(@user)
    end
  end

end
