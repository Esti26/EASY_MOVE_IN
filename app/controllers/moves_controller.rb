class MovesController < ApplicationController
  before_action :set_move, only: %i[show edit update destroy]


  def show
    @current_user = current_user
    @moves = Move.all
    @move = Move.where(move_id: params[:id]).first
  end

  def new
  end

  def create
    @move = Move.new(move_params)
    @move.owner = current_user
    if @move.save
      redirect_to moves_path, notice: 'moves was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @move = Move.new
  end

  def update
    if @move.update(move_params)
      redirect_to move_path, notice: 'move was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @move.destroy
    redirect_to moves_path, notice: 'move was successfully destroyed'
  end

  def client_index
    @moves = Move.where(client_id: current_user)
  end

  def company_index
    @moves = Move.all
  end

  private

  def set_move
    @move = Move.find(params[:id])
  end

  def move_params
    params.require(:move).permit(:date, :start_point, :end_point, :shipment_info, :status, :expiration)
  end
end
