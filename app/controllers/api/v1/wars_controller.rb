class Api::V1::WarsController < Api::V1::BaseController

  before_filter :set_war, :only => [:show, :update, :destroy]

  def show
    render 'wars/show.rabl'
  end

  def create
    @war = War.new(war_params)
    if @war.save
      render 'wars/show.rabl', :status => 201
    end
  end

  def update
    @war.update_attributes(war_params)
    render 'wars/show.rabl'
  end

  def destroy
    @war.is_disabled = true
    if @war.save
      head :no_content
    else
      render_errors(@war)
    end
  end

  private

  def set_war
    @war = War.find(params[:id])
  end

  def war_params
    params.require(:war).permit(:name, :owner_id, :is_private, :open_registration, :end_date, :end_score, :booty, :is_complete, :winner_id)
  end
end
