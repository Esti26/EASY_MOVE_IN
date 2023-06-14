class BidsController < ApplicationController
  def index

    if @company = Company.find_by(user_id: current_user.id)
      @bids = Bid.where(company_id: @company.id)
    else
      @move = Move.find(params[:move_id])
      @bids = Bid.where(move_id: @move.id)
      @hired = @move.status =="pending" && @bids.where(status: "pending").count == 1

    end

    query = params[:query]
    if query.present? && query == "price"
      @bids = @bids.order(price: :desc)
    end
  end

  def show
    @bid = Bid.find(params[:id])
    @move = @bid.move
    @current_user = current_user
  end

  def hire
    @move = Move.find(params[:move_id])
    @bid = @move.bids.find(params[:id])
    # Perform the necessary updates here
    # For example:
    @move.status = "pending"

    @bid.status = "pending"

    if @move.save && @bid.save
      redirect_to client_path, notice: "Bid hired successfully!"
    end
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
      redirect_to move_bid_path(@move, @bid)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @bid = Bid.find(params[:id])
    @move = Move.find(params[:move_id])
  end

  def update
    @bid = Bid.find(params[:id])
    if @bid.update(bid_params)
      redirect_to company_path, notice: 'Bid was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
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
