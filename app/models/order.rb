class Order < ApplicationRecord
  belongs_to :user
  belongs_to :card
  monetize :amount_cents
  validates :user_id, :card_id, presence: true
  # validates :user_id, uniqueness: { scope: :card_id }
end
