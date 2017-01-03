class Listing < ActiveRecord::Base
  belongs_to :user
  has_many :photos

  validates :name, presence: true
  validates :wine_color, presence: true
  validates :wine_desc, presence: true


  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

  end
