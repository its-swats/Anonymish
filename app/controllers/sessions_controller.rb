class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      render json: {username: user.username, zip: user.zip_code, id: user.id}
    end
  end

end
