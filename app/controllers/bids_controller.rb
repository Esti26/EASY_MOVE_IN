class BidsController < ApplicationController
  def index
    @company = Company.find_by(user_id: current_user.id)
    @bids = Bid.where(company_id: @company.id)
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

  def destroy
    @bid = Bid.find(params[:id])
    @bid.destroy
    redirect_to company_bids_path, notice: 'move was successfully destroyed'
  end

  private

  def bid_params
    params.require(:bid).permit(:price, :status, :expiration, :move_id, :company_id)
  end
end
