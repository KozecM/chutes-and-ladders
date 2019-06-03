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
    @workflow = CreatesPlayer.new(name: params[:player][:name],game_id: params[:player][:game_id])
    @workflow.create
    redirect_to players_path
  end

end
