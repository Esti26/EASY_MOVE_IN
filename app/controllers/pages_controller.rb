class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
      @moves = Move.all
  end

  def new
    @move = Move.new
  end

  def create
    @move = Move.new(move_params)
    @move.client_id = current_user
    if @move.save
      redirect_to moves_path, notice: 'Your move was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end

  end

  def log_in
    @user = User.find(:email, :password)

  end

  private
  def move_params
    params.require(:wig).permit(:color, :length, :owner_id, :price, :image_url, :title, :description, :photo, :color_code)

  end
end
