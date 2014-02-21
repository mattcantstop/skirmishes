class Api::V1::BaseController < ApplicationController

  respond_to :json, :xml, :html

  def render_errors(resource)
    @errors = { :error => resource.errors.full_messages }
    puts @errors
    render 'errors/base', :status => :unproccessible_entity
  end

end
