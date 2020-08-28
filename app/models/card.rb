class Card < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :photo, dependent: :photo
  validates :photo, presence: true
  after_create :set_sku
  monetize :price_cents

  def set_sku
    self.update( sku: "#{self.id}-#{self.name.parameterize}")
  end

  def sell!
    self.sold = true
    # self.user_id = current_user.id
    save
  end
end
