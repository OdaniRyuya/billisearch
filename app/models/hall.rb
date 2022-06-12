class Hall < ApplicationRecord
  has_one_attached :image
  has_many :favorites, dependent: :destroy  
  belongs_to :user
end
