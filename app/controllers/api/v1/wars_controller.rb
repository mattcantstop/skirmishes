class Api::V1::WarsController < Api::V1::BaseController

  before_filter :set_war

  def show
    render 'wars/show.rabl'
  end

  private

  def set_war
    @war = War.find(params[:id])
  end

end
