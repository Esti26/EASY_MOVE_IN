class CompanyController < ApplicationController
  # before_action :set_move, only: %i[show destroy]
  before_action :set_bid, only: %i[edit update destroy]

  def show
    @reviews = Review.where(company_id: params[:id])
    @company = Company.find_by(user_id: current_user.id)
    @bids = Bid.where(company_id: @company.id)
  end

  def new
    @bid = Bid.new
  end

  def create
    @bid = Bid.new(bid_params)
    @bid.owner = current_user
    @bid.move = @move
    if @bid.save
      redirect_to move_bids_path, notice: 'moves was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @move = Move.find(params[:id])
  end

  def update
    if @bid.update(bid_params)
      redirect_to move_bids_path, notice: 'bid was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @bid.destroy
    redirect_to move_bids_path, notice: 'bid was successfully destroyed.'
  end
end

  # def set_move
  #   @move = Move.find(params[:id])
  # end

#   def set_bid
#     @my_bid = Bid.find(params[:id])
#   end

  # def bid_params
  #   params.require(:bid).permit(:price, :status, :expiration)
  # end
