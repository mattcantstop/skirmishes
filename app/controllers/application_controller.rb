class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session, :if => Proc.new { |c| c.request.format == 'application/json' }

  #before_filter :current_user, :except => { :controller => :sessions, :action => :new }

  #def current_user
  #  @current_user ||= User.find(params[:user][:authentication_token])
  #end

end
