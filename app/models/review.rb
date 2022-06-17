class Review < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :hall
end
