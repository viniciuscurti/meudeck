class Card < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :photo, dependent: :photo
  validates :photo, presence: true
  after_create :set_sku
  monetize :price_cents
  validates :price_cents, presence: true

  def set_sku
    self.update( sku: "#{self.id}-#{self.name.parameterize}")
  end

  def sell!
    self.sold = true
    save
  end
end
