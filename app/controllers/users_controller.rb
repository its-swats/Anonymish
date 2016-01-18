class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    user = User.new(username: params[:username], zip_code: params[:zip], password: params[:password])
    if user.save
      render json: {:status => :ok, username: user.username, zip: user.zip_code}
    else
      render json: {:message => 'no good'}
    end    
  end
end
