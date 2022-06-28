class Review < ApplicationRecord
  belongs_to :user
  belongs_to :hall
  validates :content, presence: true
end
