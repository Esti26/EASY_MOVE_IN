class MovesController < ApplicationController
  before_action :set_move, only: %i[show edit update destroy]

  def show
    @current_user = current_user
    @move = Move.find(params[:id])
    @moves = Move.all
    @next_move = @moves.where("date > ?", Time.now).first
  end

  def new
    @move = Move.new
  end

  def create
    @move = Move.new(start_point: params[:start_point], end_point: params[:end_point], shipment_info: params[:shipment_info], date: params[:date])
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
      redirect_to client_path, notice: 'move was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @move.destroy
    redirect_to client_path, notice: 'move was successfully deleted'
  end

  def client_index
    @moves = Move.where(client_id: current_user)
    @next_move = @moves.where("date > ?", Time.now).first
    @moves = @moves.reject { |move| move.id == @next_move.id }
    @user = User.find(current_user.id)
  end

  def company_index
    if params[:query].present?
      sql_query = <<~SQL
        moves.shipment_info ILIKE :query
        OR moves.start_point ILIKE :query
        OR moves.end_point ILIKE :query
      SQL
      @moves = Move.where(sql_query, query: "%#{params[:query]}%")
    else
      @moves = Move.all
    end
    @next_move = @moves.where("date > ?", Time.now).first


    if params[:filter] == "created"
      @moves = @moves.order(created_at: :desc)
    elsif params[:filter] == "earliest"
      @moves = @moves.order(date: :asc)
    end

    @markers = @moves.geocoded.map do |move|
      {
        lat: move.latitude,
        lng: move.longitude,
        info_window_html: render_to_string(partial: "moves/info_window", locals: { move: move }, formats: [:html]),
        marker_html: render_to_string(partial: "moves/marker", locals: { move: move }, formats: [:html])
      }
    end

    respond_to do |format|
      format.html
      format.text {render partial: "moves/results", locals: { moves: @moves, markers: @markers }, formats: [:html]}
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
