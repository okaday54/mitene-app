class PostsController < ApplicationController
  

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all.order("created_at DESC").page(params[:page]).per(18)
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    post = Post.find(params[:id])
    post.edit(post_params)
    redirect_to post_path(post.id)
  end

  # POST /posts
  # POST /posts.json
  def create
    Post.create(post_params)
    redirect_to root_path
  end
  private
  def post_params
    params.require(:post).permit(:image, :comment)
  end
end

