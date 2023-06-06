class AddAverageRatingToReviews < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :average_rating, :integer
  end
end
