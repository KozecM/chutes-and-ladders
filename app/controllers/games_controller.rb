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
      name: params[:game][:name]
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
