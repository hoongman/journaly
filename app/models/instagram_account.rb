class InstagramAccount < ActiveRecord::Base
  belongs_to :user
  attr_accessible :token, :uid
end

class InstagramImage

	def initialize data
		@data = data
	end

	def self.build_images(images)
		images.map{|image| new(InstagramImage)}
	end

	def caption
		@data['caption']['text']
	end

	def created_time
		@data['created_time']
	end

	def low_res_url
		@data['images']['low_resolution']['url']
	end

	def high_res_url
		@data['images']['standard_resolution']['url']
	end

	def latitude
		@data['location']['latitude']
	end

	def longitude
		@data['location']['longitude']
	end

end