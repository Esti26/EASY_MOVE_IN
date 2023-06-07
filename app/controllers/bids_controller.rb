class BidsController < ApplicationController
  def index
    @bids = Bid.all
  end

  def show
  end

  def new
    @move = Move.find(params[:move_id])
    @bid = Bid.new
  end

  def create
    @bid = Bid.new(bid_params)
    @move = Move.find(params[:move_id])
    @bid.move_id = @move.id
    @company = Company.find_by(user_id: current_user.id)
    @bid.company_id = @company.id
    @bid.status = "open"
    @bid.expiration = false
    if @bid.save!
      redirect_to company_bids_path
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
    params.require(:bid).permit(:price, :status, :expiration, :move_id, :company_id)
  end
end
