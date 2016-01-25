class PostsController < ApplicationController
  include Geokit::Geocoders
  skip_before_action :verify_authenticity_token, only: [:create]

  def index
    if params[:coords]
      @posts = Post.within(20, :origin => params[:coords]).order(id: :desc).limit(20)
      render json: @posts
    else
      render json: {:message => 'Critical Error - please log out and back in'}, status: 401
    end
  end

  def create 
    user = User.find_by(id: params[:id], username: params[:username])
    if user
      post_info = MultiGeocoder.geocode(user.zip_code.to_s)
      user.posts.create(content: params[:post], lat: post_info.lat, lng: post_info.lng, city: post_info.district)
      render json: { :status => :ok }
    end
  end
end
