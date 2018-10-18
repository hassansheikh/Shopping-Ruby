class Product < ApplicationRecord
  belongs_to :category

  has_many :cartitems

  has_many_attached :images
  validate :image_type

  def thumbnail input
  	return self.images[input].variant(resize: "300x300!").processed
  end

  private
  def image_type
  	if images.attached? == false
  		errors.add(:images,"are Missing")
  	end
  	images.each do |image|
  		if !image.content_type.in?(%('image/jpeg image/png image/jpg'))
  			errors.add(:images ,"Need to be JPEG or PNG")
  		end
  	end
  end
end
