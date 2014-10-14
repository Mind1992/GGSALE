class Photo < ActiveRecord::Base
  extend Dragonfly::Model
  belongs_to :sale
  dragonfly_accessor :image
 
  validates :image, presence: true
  validates_size_of :image, maximum: 3000.kilobytes,
                    message: "should be no more than 500 KB", if: :image_changed?
 
  validates_property :format, of: :image, in: [:jpeg, :jpg, :png, :bmp], case_sensitive: false,
                     message: "should be either .jpeg, .jpg, .png, .bmp", if: :image_changed?
end