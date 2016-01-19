class PostsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def index
    @posts = Post.all.order(id: :desc).limit(20)
    render json: @posts
  end

  def create
    user = User.find_by(id: params[:id], username: params[:username])
    if user
        user.posts.create(content: params[:post])
        render json: { :status => :ok }
    end
  end
end
