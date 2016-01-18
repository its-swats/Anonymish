class PostsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def index
    @posts = Post.all.order(id: :desc).limit(8)
    render json: @posts
  end

  def create
    Post.create(content: params[:post])
    render json: { :status => :ok }
  end
end
