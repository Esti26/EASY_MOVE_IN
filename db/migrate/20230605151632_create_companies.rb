class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.references :user, null: false, foreign_key: true
      t.text :address
      t.text :name
      t.timestamps
    end
  end
end
