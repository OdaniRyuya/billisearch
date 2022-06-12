class User < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :halls
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, uniqueness: true
  mount_uploader :image, ImageUploader

  def favorite_find(hall_id)
    favorites.where(hall_id: hall_id).exists?
  end

end
