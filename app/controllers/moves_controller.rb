class MovesController < ApplicationController
  before_action :set_move, only: %i[show edit update destroy]

  def show
    @current_user = current_user
    @moves = Move.all
    @move = Move.find(params[:id])
  end

  def new
    @move = Move.new
  end

  def create
    @move = Move.new(move_params)
    @move.client_id = current_user.id
    if @move.save
      redirect_to client_path, notice: 'moves was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @move.update(move_params)
      redirect_to @move, notice: 'move was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @move.destroy
    redirect_to client_path, notice: 'move was successfully destroyed'
  end

  def client_index
    @moves = Move.where(client_id: current_user)
  end

  def company_index
    @moves = Move.all
    @markers = @moves.geocoded.map do |move|
      {
        lat: move.latitude,
        lng: move.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {move: move}),
        marker_html: render_to_string(partial: "marker", locals: {move: move })
      }
    end
  end

  private

  def set_move
    @move = Move.find(params[:id])
  end

  def move_params
    params.require(:move).permit(:date, :start_point, :end_point, :shipment_info)
  end
end
