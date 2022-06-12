class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :hall

  validates_uniqueness_of :hall_id, scope: :user_id 

end
