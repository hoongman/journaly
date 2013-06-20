class InstagramController < ApplicationController


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

  # All methods require authentication (either by client ID or access token).
# To get your Instagram OAuth credentials, register an app at http://instagr.am/oauth/client/register/
  def show

  end # end of def show


  def link
    trip_id, place_id = params['trip_place_id'].split('@')
    @trip = Trip.find(trip_id)
    @place = @trip.places.find(place_id)

    code = params['code']
    user =  User.find(session[:user])
    begin
       #@response = RestClient.post 'https://api.instagram.com/oauth/access_token', { :code => code, :client_id => 'f3c6d901c4964e6097d14d208fa01a96', :client_secret => '9f2e75a6dde749cbadf4cddc5260ea63', :grant_type => 'authorization_code', :redirect_uri => 'http://localhost:3000/instagram/link'}

      @response = RestClient.get 'https://api.instagram.com/v1/users/24480272/media/recent/?access_token=24480272.f3c6d90.7eada26532fc4d8aa4ae408a904d5216'

      instagram = JSON.parse(@response)

      user.create_instagram_account(uid: instagram['user']['id'], token: instagram['access_token'])

      #@image = instagram[data]

      #

      #instagram[data].map{|image| InstagramImage.build_images(image) return image}
      rescue Exception => e
        puts 'boom'
        puts e.message
        puts e.inspect



    end
    puts '^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^'
    puts @response
    puts '================================================='
    puts instagram
    puts '**************************************************'
    puts instagram[data]


    images = InstagramImage.build_images(instagram)
    puts images
    puts '***************************************************'
    image =  images.pop
    puts image
    #puts InstagramImage.new(image).caption


    #image_array.map{|image| my_images << InstagramImage.build_images(image.to_json)}


  end
end

#   def recent_instagram_media(user)
#     RestClient.get "https://api.instagram.com/v1/users/#{user.instagram_id}/media/recent/?access_token=#{user.instagramm_access_token}"

#   end

# end
# Step One: Direct your user to our authorization URL
# https://api.instagram.com/oauth/authorize/?client_id=CLIENT-ID&redirect_uri=REDIRECT-URI&response_type=code

# Step Two: Receive the redirect from Instagram
# http://your-redirect-uri?code=CODE

# Step Three: Request the access_token
