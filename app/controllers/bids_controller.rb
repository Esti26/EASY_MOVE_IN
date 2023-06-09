class BidsController < ApplicationController

  skip_forgery_protection

  def index
    @company = Company.find_by(user_id: current_user.id)
    if @company
      @bids = Bid.where(company_id: @company.id)
    else
      @move = Move.find(params[:move_id])
      @bids = Bid.where(move_id: @move.id)
      @hired = @move.status == "pending" && @bids.where(status: "pending").count == 1
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
    @bid = Bid.find(params[:id])
    @move = @bid.move
    # Perform the necessary updates here
    # For example:
    @move.status = "pending"

    @bid.status = "pending"

    if @move.save! && @bid.save!
      redirect_to client_path, notice: "Bid hired successfully!"
    end
  end

  def update_bid_status
    # @move = Move.find(params[:move_id])
    @bid = Bid.find(params[:id])
    move = @bid.move

    p @bid.to_json
    p move.to_json

    if @bid.status == "pending"
      @bid.status = "confirmed"
      move.status = "confirmed"
      move.save!
      @bid.save!
    end
    @bids = Bid.where(move_id: move.id)

    respond_to do |format|
      format.html
      format.text {render partial: "bids/bids", locals: { bids: @bids}, formats: [:html]}
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
    bids_generator
    if @bid.save!
      redirect_to company_path
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

  def bids_generator
    bid1 = Bid.create(price: 100,status: "open", expiration: false,move: @move,company_id: Company.find_by(user_id: User.find_by(first_name: "Emma").id).id)
    bid2 = Bid.create(price: 200,status: "open", expiration: false,move: @move,company_id: Company.find_by(user_id: User.find_by(first_name: "Josh").id).id)
    bid3 = Bid.create(price: 140,status: "open",expiration: false,move: @move,company_id: Company.find_by(user_id: User.find_by(first_name: "Zakarya").id).id)
    bid4 = Bid.create(price: 180,status: "open", expiration: false,move: @move,company_id: Company.find_by(user_id: User.find_by(first_name: "Pedro").id).id)
    bid5 = Bid.create(price: 120,status: "open", expiration: false,move: @move,company_id: Company.find_by(user_id: User.find_by(first_name: "Santi").id).id)
    bid1.save!
    bid2.save!
    bid3.save!
    bid4.save!
    bid5.save!
  end
end
