class Api::V1::BattlesController < ApplicationController

  def create
    @battle = Battle.new(battle_params)
    if @battle.save
      render 'battles/show.rabl', :status => 201
    else
      render_errors(@battle)
    end
  end

  private

  def battle_params
binding.pry
    params.require(:battle).permit(:notes, :user_id, :war_id)
  end

end
