class Card < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :photo, dependent: :photo
  validates :photo, presence: true

  def sell!
    self.sold = true
    save
  end
end
