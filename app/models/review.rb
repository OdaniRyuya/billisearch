class Review < ApplicationRecord
  belongs_to :user
  belongs_to :hall
end
