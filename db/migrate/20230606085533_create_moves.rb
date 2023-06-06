class CreateMoves < ActiveRecord::Migration[7.0]
  def change
    create_table :moves do |t|
      t.integer :date
      t.string :start_point
      t.string :end_point
      t.text :shipment_info
      t.string :status
      t.boolean :expiration
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
