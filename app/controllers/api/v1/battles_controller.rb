class Api::V1::BattlesController < ApplicationController

  def create
    @battle = Battle.new(battle_params)
    if @battle.save
      render 'battles/show.rabl', :status => 201
    else
      render_errors(@battle)
    end
  end

  def show
    @battle = Battle.find(params[:id])
    render 'battles/show.rabl'
  end

  private

  def battle_params
    params.require(:battle).permit(:notes, :user_id, :war_id)
  end

end
