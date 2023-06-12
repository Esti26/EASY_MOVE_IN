class Move < ApplicationRecord
  belongs_to :client
  has_many :bids
  geocoded_by :start_point
  after_validation :geocode, if: :will_save_change_to_start_point?
end
