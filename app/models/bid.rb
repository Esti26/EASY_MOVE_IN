class Bid < ApplicationRecord
  belongs_to :move
  belongs_to :company
end
