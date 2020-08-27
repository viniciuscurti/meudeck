class User < ApplicationRecord
  has_many :cards
  has_many :orders
  has_one_attached :photo, dependent: :photo
  validates :username, presence: true, uniqueness: true, length: { maximum: 15 } 
  validates :address, presence: true
  validates :address_number, presence: true, length: { maximum: 6 } ,numericality: { only_integer: true }
  validates :address_number, presence: true, length: { maximum: 10 }
  validates :city, presence: true
  validates :country, presence: true   
  validates :zip_code, presence: true, length: { maximum: 9 }
  validates :phone, presence: true, length: { maximum: 11 } 

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
