class Api::V1::SessionsController < Devise::SessionsController

  def create
    user = User.where(:username => params[:user][:username] || :email => params[:user][:email])
    if user && user.authenticate
      render 'war/show.rabl'
    else
      render_errors(@user)
    end
  end


end
