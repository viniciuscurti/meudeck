class Card < ApplicationRecord
  belongs_to :user
  has_one :order
end