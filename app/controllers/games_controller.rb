class GamesController < ApplicationController
  def new
    @game = Game.new
  end

  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
  end

  def create
    @game_workflow = CreatesGame.new(
      name: params[:game][:name],
      player_one_name: params[:game][:player_one_name],
      player_two_name: params[:game][:player_two_name]
    )
    @game_workflow.create

    @player_one_workflow = CreatesPlayer.new(name: params[:game][:player_one_name])
    @player_two_workflow = CreatesPlayer.new(name: params[:game][:player_one_name])

    @player_one_workflow.create
    @player_two_workflow.create
    
    redirect_to action: 'show', id: @game_workflow.game.id
  end

end
