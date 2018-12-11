class PositionsController < ApplicationController
  def index
    @position = Position.all
  end

  def create
    @position = Position.new(params[:position].permit(:latitude, :longitude))
    @position.save
    redirect_to boards_show_path(params[:position])
  end
end
