class Picture < ApplicationRecord
	mount_uploader :image, AvatarUploader
	belongs_to :movie
def all_picture
		"#{self.image}"
	end
end
