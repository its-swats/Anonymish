class UsersController < ApplicationController
  include Geokit::Geocoders
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    user = User.new(username: params[:username], zip_code: params[:zip], password: params[:password])
    if user.save
      user_info = MultiGeocoder.geocode(user.zip_code.to_s)
      render json: {:status => :ok, username: user.username, coords: [user_info.lat, user_info.lng], id: user.id}
    else
      render json: {:message => 'no good'}
    end    
  end
end
