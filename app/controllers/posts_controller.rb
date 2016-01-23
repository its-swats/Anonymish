class PostsController < ApplicationController
  include Geokit::Geocoders
  skip_before_action :verify_authenticity_token, only: [:create]

  def index
    if params[:zip]
      user_info = MultiGeocoder.geocode(params[:zip].to_s)
      @posts = Post.within(20, :origin => user_info).order(id: :desc).limit(20)
      render json: @posts
    else
      render json: {}, status: 401
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
