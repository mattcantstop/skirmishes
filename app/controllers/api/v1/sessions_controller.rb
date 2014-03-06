class Api::V1::SessionsController < Devise::SessionsController

  def create
    login = params[:username] || params[:email]
    if login.include?('@')
      user = User.find_by_email(login)
    else
      user = User.find_by_username(login)
    end
    if user && user.authenticate_api_v1_user
      render 'war/show.rabl'
    else
      render_errors(@user)
    end
  end


end
