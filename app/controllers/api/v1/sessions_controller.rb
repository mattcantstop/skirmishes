class Api::V1::SessionsController < Api::V1::BaseController

  def create
    user = User.where(:username => params[:signin][:username] || :email => params[:signin][:email])
    if user && user.authenticate
      
    end
  end


end
