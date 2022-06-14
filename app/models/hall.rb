class Hall < ApplicationRecord
  has_one_attached :image
  has_many :favorites, dependent: :destroy  
  has_many :reviews
  belongs_to :user, optional:true

  scope :updated_asc, -> {order(updated_at: :asc)}
  scope :updated_desc, -> {order(updated_at: :desc)}
  scope :favorites_desc, -> {select('halls.*', 'count(favorites.id) AS favorites')
                            .left_joins(:favorites)
                            .group('halls.id')
                            .order('favorites DESC')}
  scope :reviews_desc, -> {select('halls.*', 'count(reviews.id) AS reviews')
                            .left_joins(:reviews)
                            .group('halls.id')
                            .order('reviews DESC')}                          


end
