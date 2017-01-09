class Listing < ActiveRecord::Base
  belongs_to :user
  has_many :photos
  has_many :reviews


  validates :name, presence: true
  validates :wine_color, presence: true
  validates :wine_desc, presence: true


  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

  def average_star_rate
    reviews.count == 0 ? 3 : reviews.average(:rate).round(1)
  end

end
