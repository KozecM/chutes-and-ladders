class SpacesController < ApplicationController
  def index
    @spaces = Space.all
  end

  def show
    @space = Space.find(params[:id])
  end

  def new
    @space = Space.new
  end

  def create
    @workflow = CreatesSpace.new(space_type: params[:space][:space_type])
    @workflow.create
    redirect_to spaces_path
  end

end
