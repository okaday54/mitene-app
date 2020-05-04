class PostsController < ApplicationController

  def index
    @posts = Post.all.order("created_at DESC").page(params[:page]).per(18)
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
  end

  def new
    @post = Post.new
  end

  def edit
    post = Post.find(params[:id])
    post.edit(post_params)
    redirect_to post_path(post.id)
  end

  def create
    Post.create(post_params)
    redirect_to root_path
  end

  private
  def post_params
    params.require(:post).permit(:id,:image, :comment)
  end
end

