class Api::V1::BaseController < ApplicationController

  respond_to :json, :xml, :html

  def render_errors(resource)
    @errors = { :error => @user.errors.full_messages }
    render 'errors/base', :status => :unproccessible_entity
  end

end
