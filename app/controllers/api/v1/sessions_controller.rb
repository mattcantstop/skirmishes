class Api::V1::SessionsController < ApplicationController

  before_filter :find_user

  def create
    binding.pry
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      render 'war/show.rabl'
    else
      render_errors(@user)
    end
  end

  private

  def find_user
    login = params[:username] || params[:email]
    if login.include?('@')
      @user = User.find_by_email(login)
    else
      @user = User.find_by_username(login)
    end
  end

end
