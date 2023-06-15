class Move < ApplicationRecord
  include PgSearch::Model
  belongs_to :client
  has_many :bids, dependent: :destroy
  geocoded_by :start_point
  after_validation :geocode, if: :will_save_change_to_start_point?
  pg_search_scope :search_by_shipment_info_and_address,
  against: [ :shipment_info, :start_point, :end_point ],
  using: {
    tsearch: { prefix: true }
  }
end
