class PostsController < ApplicationController
  

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all.order("created_at DESC").page(params[:page]).per(18)
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    Post.create(post_params)
    redirect_to root_path
  end
  private
  def post_params
    params.require(:post).permit(:image)
  end
end

