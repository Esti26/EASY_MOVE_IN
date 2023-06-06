class CreateChatrooms < ActiveRecord::Migration[7.0]
  def change
    create_table :chatrooms do |t|
      t.string :status
      t.references :company, null: false, foreign_key: true
      t.references :client, null: false, foreign_key: true
      t.references :message, null: false, foreign_key: true

      t.timestamps
    end
  end
end
