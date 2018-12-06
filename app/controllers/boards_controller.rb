class BoardsController < ApplicationController
  before_action :logged_in_user
  before_action :correct_board,  only: [:show]

  def index
    @user = User.find(current_user.id)
    @boards = Board.where(user_id: current_user.id)
    @middle = Middle.where(user_id: current_user.id)
    @newBoard = Board.new(user_id: current_user.id)
  end

  def show
    @board = Board.find(params[:id])
    @user = @board.user
    @wave = Wave.where(board_id: params[:id])
    @newWave = Wave.new(:board_id => params[:id])

    @manner = Manner.where(board_id: params[:id])
    @newManner = Manner.new(:board_id => params[:id])

    @mood = Mood.where(board_id: params[:id]).last
    @newMood = Mood.new(:board_id =>params[:id])

    @map = Map.where(board_id: params[:id])
    @newMap = Map.new(:board_id => params[:id])

    @photo = Photo.all

    @hash = Gmaps4rails.build_markers(@map) do |place, marker|
      marker.lat place.latitude
      marker.lng place.longitude
      marker.infowindow place.address
    end
  end

  def search
    @users = User.all
    @other = User.search(params[:search], current_user.name)

    @board_id = params[:board_id]
    @middle = Middle.new
  end

  def create
    @board = Board.new(board_params)
    if @board.save
      redirect_to board_path
    else
      redirect_to board_path
    end
  end

  # ボード削除用変数設定
  def destroy
    @board = Board.find(params[:format])
    @board.destroy
    flash[:success] = "Board deleted"

    redirect_to board_path
  end

  # beforeアクション
  # ログイン済みユーザーかどうか確認
  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_path
    end
  end

  # ログインしているユーザーのボードかどうか確認
  def correct_board
    @board = Board.find(params[:id])
    redirect_to board_path unless current_board?(@board) || accessboard(current_user)
  end

  private

  def board_params
    params[:board].permit(:location, :user_id)
  end
end
