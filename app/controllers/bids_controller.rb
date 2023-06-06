class BidsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @move = Move.find(params[:move_id])
    @bid = Bid.new
  end

  def create
    @move = move.find(params[:move_id])
    @bid = Bid.new(bid_params)
    @bid.company_id = Company.find_by(user_id: current_user).id
    @bid.status = "pending approval"
    @bid.move_id = @move
    if @bid.save
      redirect_to move_path(@move)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

  def bid_params
    params.require(:bid).permit(:price, :status, :expiration, :move_id, :company_id, :move_id)
  end
end
