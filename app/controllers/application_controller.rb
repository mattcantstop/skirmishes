class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session, :if => Proc.new { |c| c.request.format == 'application/json' }

  before_filter :current_user, :except => { :controller => :sessions, :action => :new }

  def current_user
    @user ||= User.find(params[:id])
  end

end
