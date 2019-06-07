class PlayersController < ApplicationController
  def index
    @players = Player.all
  end

  def show
    @player = Player.find(params[:id])
  end

  def new
    @player = Player.new
  end

  def create
    @player_workflow = CreatesPlayer.new(
      name: params[:player][:name],
      game_id: params[:player][:game_id])

    @player_workflow.create

   if @player_workflow.player.errors.any?
      @player = @player_workflow.player
      render :new
    else
      redirect_to players_path
    end

  end

end
