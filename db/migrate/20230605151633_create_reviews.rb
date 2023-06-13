class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.references :client, null: false, foreign_key: true
      t.references :company, null: false, foreign_key: true
      t.integer :efficiency_rating
      t.integer :punctuality_rating
      t.integer :politeness_rating
      t.string :image
      t.text :content
      t.timestamps
    end
  end
end
