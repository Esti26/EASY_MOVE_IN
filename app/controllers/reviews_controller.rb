class ReviewsController < ApplicationController
  def new
    @company = Company.find(params[:company_id])
    @review = Review.new()
  end

  def create
    @review = Review.new(review_params)
    @company = Company.find(params[:company_id])
    @review.company_id = @company.id
    if @review.save
      redirect_to(company_index_path(params[:company_id]))
    else
      render 'company/show', status: :unprocessable_entity
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    if @review.update(review_params)
      redirect_to company_show_path, notice: 'Review was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def delete
    @review.destroy
    redirect_to move_bids_path, notice: 'bid was successfully destroyed.'
  end

  private

  def review_params
    params.require(:review).permit(:efficiency_rating, :punctuality_rating, :politeness_rating, :image, :content)
  end
end
