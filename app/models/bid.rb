class Bid < ApplicationRecord
  belongs_to :move
  belongs_to :company

  def confirm!
    update(status: "confirmed")
    move.update(status: "confirmed")
  end
end
