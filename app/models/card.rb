class Card < ApplicationRecord
  belongs_to :user
  has_one :order

  def sell!
    self.sold = true
    save
  end
end
