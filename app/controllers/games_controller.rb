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

    if @game_workflow.game.errors.any?
      @game = @game_workflow.game
      render :new
    else
      redirect_to action: 'show', id: @game_workflow.game.id
    end
      
  end

end
