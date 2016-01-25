class SessionsController < ApplicationController
  include Geokit::Geocoders
  skip_before_action :verify_authenticity_token, only: [:create]
  

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      user_info = MultiGeocoder.geocode(user.zip_code.to_s)
      render json: {username: user.username, coords: [user_info.lat, user_info.lng], id: user.id}
    else
      render json: {message: 'Incorrect username or password'}, status: 401
    end
  end

end
