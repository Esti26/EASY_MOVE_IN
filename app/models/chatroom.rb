class Chatroom < ApplicationRecord
  belongs_to :company
  belongs_to :client
  belongs_to :message
end
