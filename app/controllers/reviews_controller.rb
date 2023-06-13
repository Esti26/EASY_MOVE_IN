class ReviewsController < ApplicationController
  def new
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
  end

  def edit
  end

  def update
  end

  def delete
  end
end
