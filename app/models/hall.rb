class Hall < ApplicationRecord
  has_one_attached :image
  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy
  belongs_to :user, optional:true

  ransacker :favorites_count do
    query = '(SELECT COUNT(favorites.hall_id) FROM favorites where favorites.hall_id = halls.id GROUP BY favorites.hall_id)'
    Arel.sql(query)
  end

  ransacker :reviews_count do
    query = '(SELECT COUNT(reviews.hall_id) FROM reviews where reviews.hall_id = halls.id GROUP BY reviews.hall_id)'
    Arel.sql(query)
  end







end
